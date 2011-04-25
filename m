From: heiko at zuerker.org <heiko@zuerker.org>
Date: Mon, 25 Apr 2011 13:13:27 -0500
Subject: [Buildroot] [PATCH] samba: bump version to 3.5.8 and add additional
	config options
Message-ID: <2e532c33a334304b91e6c301447d887472afdcfd.1303755152.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/samba/Config.in                            |   16 +
 package/samba/samba-CVE-2011-0719.patch            |  613 --------------------
 package/samba/samba-add-check-for-__use_bsd.patch  |   18 -
 .../samba/samba-do-not-check-glibc-version.patch   |  104 ----
 package/samba/samba-fix-client-mtab.patch          |   11 -
 package/samba/samba-fix-mount.cifs.patch           |   18 -
 package/samba/samba-getgrouplist.patch             |   41 --
 package/samba/samba-remove-legacy-index.patch      |   20 -
 package/samba/samba.mk                             |   27 +-
 9 files changed, 31 insertions(+), 837 deletions(-)
 delete mode 100644 package/samba/samba-CVE-2011-0719.patch
 delete mode 100644 package/samba/samba-add-check-for-__use_bsd.patch
 delete mode 100644 package/samba/samba-do-not-check-glibc-version.patch
 delete mode 100644 package/samba/samba-fix-client-mtab.patch
 delete mode 100644 package/samba/samba-fix-mount.cifs.patch
 delete mode 100644 package/samba/samba-getgrouplist.patch
 delete mode 100644 package/samba/samba-remove-legacy-index.patch

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 58a84f3..ba1c63d 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -260,5 +260,21 @@ config BR2_PACKAGE_SAMBA_GAMIN
 comment "support gamin - disabled (requires gamin)"
 	depends on !BR2_PACKAGE_GAMIN
 
+config BR2_PACKAGE_SAMBA_NSS_WRAPPER
+	bool "Turn on nss wrapper library"
+	default n
+	
+config BR2_PACKAGE_SAMBA_SOCKET_WRAPPER
+	bool "Turn on socket wrapper library"
+	default n
+	
+config BR2_PACKAGE_SAMBA_QUOTA
+	bool "Include disk-quota support"
+	default n
+	
+config BR2_PACKAGE_SAMBA_AIO
+	bool "Include asynchronous io support"
+	default n
+	
 endmenu
 
diff --git a/package/samba/samba-CVE-2011-0719.patch b/package/samba/samba-CVE-2011-0719.patch
deleted file mode 100644
index 1cb8580..0000000
--- a/package/samba/samba-CVE-2011-0719.patch
+++ /dev/null
@@ -1,613 +0,0 @@
-From 724e44eed299c618066dec411530aa9f156119ec Mon Sep 17 00:00:00 2001
-From: Karolin Seeger <kseeger@samba.org>
-Date: Sun, 27 Feb 2011 18:28:29 +0100
-Subject: [PATCH] Fix denial of service - memory corruption.
-
-CVE-2011-0719
-
-Fix bug #7949 (DoS in Winbind and smbd with many file descriptors open).
-
-All current released versions of Samba are vulnerable to
-a denial of service caused by memory corruption. Range
-checks on file descriptors being used in the FD_SET macro
-were not present allowing stack corruption. This can cause
-the Samba code to crash or to loop attempting to select
-on a bad file descriptor set.
-
-A connection to a file share, or a local account is needed
-to exploit this problem, either authenticated or unauthenticated
-(guest connection).
-
-Currently we do not believe this flaw is exploitable
-beyond a crash or causing the code to loop, but on the
-advice of our security reviewers we are releasing fixes
-in case an exploit is discovered at a later date.
----
- source/client/client.c          |    4 +++-
- source/client/dnsbrowse.c       |   12 ++++++++++++
- source/lib/events.c             |   13 +++++++++++++
- source/lib/packet.c             |    5 +++++
- source/lib/readline.c           |    5 +++++
- source/lib/select.c             |    6 ++++++
- source/lib/util_sock.c          |   11 +++++++++--
- source/libaddns/dnssock.c       |    6 +++++-
- source/libsmb/nmblib.c          |    5 +++++
- source/nmbd/nmbd_packets.c      |   24 ++++++++++++++++++++++--
- source/nsswitch/wb_common.c     |   22 ++++++++++++++++++++--
- source/printing/printing.c      |    5 +++++
- source/smbd/dnsregister.c       |    6 ++++++
- source/smbd/oplock.c            |    5 ++++-
- source/smbd/oplock_irix.c       |    5 +++++
- source/smbd/process.c           |    2 +-
- source/smbd/server.c            |   29 +++++++++++++++++++++--------
- source/utils/smbfilter.c        |    8 ++++++--
- source/winbindd/winbindd.c      |   12 +++++++++++-
- source/winbindd/winbindd_dual.c |    7 +++++++
- 20 files changed, 171 insertions(+), 21 deletions(-)
-
-diff --git a/source/client/client.c b/source/client/client.c
-index 53bd9e6..a989441 100644
---- a/source/client/client.c
-+++ b/source/client/client.c
-@@ -4379,8 +4379,10 @@ static void readline_callback(void)
- 
-  again:
- 
--	if (cli->fd == -1)
-+	if (cli->fd < 0 || cli->fd >= FD_SETSIZE) {
-+		errno = EBADF;
- 		return;
-+	}
- 
- 	FD_ZERO(&fds);
- 	FD_SET(cli->fd,&fds);
-diff --git a/source/client/dnsbrowse.c b/source/client/dnsbrowse.c
-index 5e3a4de..aa2fb22 100644
---- a/source/client/dnsbrowse.c
-+++ b/source/client/dnsbrowse.c
-@@ -81,6 +81,11 @@ static void do_smb_resolve(struct mdns_smbsrv_result *browsesrv)
- 			TALLOC_FREE(fdset);
- 		}
- 
-+		if (mdnsfd < 0 || mdnsfd >= FD_SETSIZE) {
-+			errno = EBADF;
-+			break;
-+		}
-+
- 		fdsetsz = howmany(mdnsfd + 1, NFDBITS) * sizeof(fd_mask);
- 		fdset = TALLOC_ZERO(ctx, fdsetsz);
- 		FD_SET(mdnsfd, fdset);
-@@ -183,6 +188,13 @@ int do_smb_browse(void)
- 
- 		fdsetsz = howmany(mdnsfd + 1, NFDBITS) * sizeof(fd_mask);
- 		fdset = TALLOC_ZERO(ctx, fdsetsz);
-+
-+		if (mdnsfd < 0 || mdnsfd >= FD_SETSIZE) {
-+			errno = EBADF;
-+			TALLOC_FREE(ctx);
-+			return 1;
-+		}
-+
- 		FD_SET(mdnsfd, fdset);
- 
- 		tv.tv_sec = 1;
-diff --git a/source/lib/events.c b/source/lib/events.c
-index cd20ceb..2ddbab7 100644
---- a/source/lib/events.c
-+++ b/source/lib/events.c
-@@ -140,6 +140,11 @@ struct fd_event *event_add_fd(struct event_context *event_ctx,
- {
- 	struct fd_event *fde;
- 
-+	if (fd < 0 || fd >= FD_SETSIZE) {
-+		errno = EBADF;
-+		return NULL;
-+	}
-+
- 	if (!(fde = TALLOC_P(mem_ctx, struct fd_event))) {
- 		return NULL;
- 	}
-@@ -190,6 +195,14 @@ bool event_add_to_select_args(struct event_context *event_ctx,
- 	bool ret = False;
- 
- 	for (fde = event_ctx->fd_events; fde; fde = fde->next) {
-+		if (fde->fd < 0 || fde->fd >= FD_SETSIZE) {
-+			/* We ignore here, as it shouldn't be
-+			   possible to add an invalid fde->fd
-+			   but we don't want FD_SET to see an
-+			   invalid fd. */
-+			continue;
-+		}
-+
- 		if (fde->flags & EVENT_FD_READ) {
- 			FD_SET(fde->fd, read_fds);
- 			ret = True;
-diff --git a/source/lib/packet.c b/source/lib/packet.c
-index e048616..512c7f2 100644
---- a/source/lib/packet.c
-+++ b/source/lib/packet.c
-@@ -106,6 +106,11 @@ NTSTATUS packet_fd_read_sync(struct packet_context *ctx)
- 	int res;
- 	fd_set r_fds;
- 
-+	if (ctx->fd < 0 || ctx->fd >= FD_SETSIZE) {
-+		errno = EBADF;
-+		return map_nt_error_from_unix(errno);
-+	}
-+
- 	FD_ZERO(&r_fds);
- 	FD_SET(ctx->fd, &r_fds);
- 
-diff --git a/source/lib/readline.c b/source/lib/readline.c
-index 34867aa..70a82f2 100644
---- a/source/lib/readline.c
-+++ b/source/lib/readline.c
-@@ -91,6 +91,11 @@ static char *smb_readline_replacement(const char *prompt, void (*callback)(void)
- 		timeout.tv_sec = 5;
- 		timeout.tv_usec = 0;
- 
-+		if (fd < 0 || fd >= FD_SETSIZE) {
-+			errno = EBADF;
-+			break;
-+		}
-+
- 		FD_ZERO(&fds);
- 		FD_SET(fd,&fds);
- 
-diff --git a/source/lib/select.c b/source/lib/select.c
-index c3da6a9..2d5f02c 100644
---- a/source/lib/select.c
-+++ b/source/lib/select.c
-@@ -61,6 +61,11 @@ int sys_select(int maxfd, fd_set *readfds, fd_set *writefds, fd_set *errorfds, s
- 		if (pipe(select_pipe) == -1)
- 			smb_panic("Could not create select pipe");
- 
-+		if (select_pipe[0] < 0 || select_pipe[0] >= FD_SETSIZE) {
-+			errno = EBADF;
-+			return -1;
-+		}
-+
- 		/*
- 		 * These next two lines seem to fix a bug with the Linux
- 		 * 2.0.x kernel (and probably other UNIXes as well) where
-@@ -87,6 +92,7 @@ int sys_select(int maxfd, fd_set *readfds, fd_set *writefds, fd_set *errorfds, s
- 		readfds2 = &readfds_buf;
- 		FD_ZERO(readfds2);
- 	}
-+
- 	FD_SET(select_pipe[0], readfds2);
- 
- 	errno = 0;
-diff --git a/source/lib/util_sock.c b/source/lib/util_sock.c
-index 650bd13..8aa2c97 100644
---- a/source/lib/util_sock.c
-+++ b/source/lib/util_sock.c
-@@ -960,6 +960,11 @@ NTSTATUS read_socket_with_timeout(int fd, char *buf,
- 	timeout.tv_usec = (long)(1000 * (time_out % 1000));
- 
- 	for (nread=0; nread < mincnt; ) {
-+		if (fd < 0 || fd >= FD_SETSIZE) {
-+			errno = EBADF;
-+			return map_nt_error_from_unix(EBADF);
-+		}
-+
- 		FD_ZERO(&fds);
- 		FD_SET(fd,&fds);
- 
-@@ -1492,7 +1497,7 @@ bool open_any_socket_out(struct sockaddr_storage *addrs, int num_addrs,
- 
- 	for (i=0; i<num_addrs; i++) {
- 		sockets[i] = socket(addrs[i].ss_family, SOCK_STREAM, 0);
--		if (sockets[i] < 0)
-+		if (sockets[i] < 0 || sockets[i] >= FD_SETSIZE)
- 			goto done;
- 		set_blocking(sockets[i], false);
- 	}
-@@ -1541,8 +1546,10 @@ bool open_any_socket_out(struct sockaddr_storage *addrs, int num_addrs,
- 	FD_ZERO(&r_fds);
- 
- 	for (i=0; i<num_addrs; i++) {
--		if (sockets[i] == -1)
-+		if (sockets[i] < 0 || sockets[i] >= FD_SETSIZE) {
-+			/* This cannot happen - ignore if so. */
- 			continue;
-+		}
- 		FD_SET(sockets[i], &wr_fds);
- 		FD_SET(sockets[i], &r_fds);
- 		if (sockets[i]>maxfd)
-diff --git a/source/libaddns/dnssock.c b/source/libaddns/dnssock.c
-index 7c8bd41..f427bd5 100644
---- a/source/libaddns/dnssock.c
-+++ b/source/libaddns/dnssock.c
-@@ -218,7 +218,11 @@ static DNS_ERROR read_all(int fd, uint8 *data, size_t len)
- 	while (total < len) {
- 		ssize_t ret;
- 		int fd_ready;
--		
-+
-+		if (fd < 0 || fd >= FD_SETSIZE) {
-+			return ERROR_DNS_SOCKET_ERROR;
-+		}
-+
- 		FD_ZERO( &rfds );
- 		FD_SET( fd, &rfds );
- 
-diff --git a/source/libsmb/nmblib.c b/source/libsmb/nmblib.c
-index bfe5e7b..768e54d 100644
---- a/source/libsmb/nmblib.c
-+++ b/source/libsmb/nmblib.c
-@@ -1097,6 +1097,11 @@ struct packet_struct *receive_packet(int fd,enum packet_type type,int t)
- 	struct timeval timeout;
- 	int ret;
- 
-+	if (fd < 0 || fd >= FD_SETSIZE) {
-+		errno = EBADF;
-+		return NULL;
-+	}
-+
- 	FD_ZERO(&fds);
- 	FD_SET(fd,&fds);
- 	timeout.tv_sec = t/1000;
-diff --git a/source/nmbd/nmbd_packets.c b/source/nmbd/nmbd_packets.c
-index 4b97819..03e5362 100644
---- a/source/nmbd/nmbd_packets.c
-+++ b/source/nmbd/nmbd_packets.c
-@@ -1683,7 +1683,7 @@ static bool create_listen_fdset(fd_set **ppset, int **psock_array, int *listen_n
- 	for (subrec = FIRST_SUBNET; subrec; subrec = NEXT_SUBNET_EXCLUDING_UNICAST(subrec))
- 		count++;
- 
--	if((count*2) + 2 > FD_SETSIZE) {
-+	if((count*2) + 2 >= FD_SETSIZE) {
- 		DEBUG(0,("create_listen_fdset: Too many file descriptors needed (%d). We can \
- only use %d.\n", (count*2) + 2, FD_SETSIZE));
- 		SAFE_FREE(pset);
-@@ -1699,24 +1699,44 @@ only use %d.\n", (count*2) + 2, FD_SETSIZE));
- 	FD_ZERO(pset);
- 
- 	/* Add in the broadcast socket on 137. */
-+	if (ClientNMB < 0 || ClientNMB >= FD_SETSIZE) {
-+		errno = EBADF;
-+		SAFE_FREE(pset);
-+		return True;
-+	}
-+
- 	FD_SET(ClientNMB,pset);
- 	sock_array[num++] = ClientNMB;
- 	*maxfd = MAX( *maxfd, ClientNMB);
- 
- 	/* Add in the 137 sockets on all the interfaces. */
- 	for (subrec = FIRST_SUBNET; subrec; subrec = NEXT_SUBNET_EXCLUDING_UNICAST(subrec)) {
-+		if (subrec->nmb_sock < 0 || subrec->nmb_sock >= FD_SETSIZE) {
-+			/* We have to ignore sockets outside FD_SETSIZE. */
-+			continue;
-+		}
- 		FD_SET(subrec->nmb_sock,pset);
- 		sock_array[num++] = subrec->nmb_sock;
- 		*maxfd = MAX( *maxfd, subrec->nmb_sock);
- 	}
- 
- 	/* Add in the broadcast socket on 138. */
-+	if (ClientDGRAM < 0 || ClientDGRAM >= FD_SETSIZE) {
-+		errno = EBADF;
-+		SAFE_FREE(pset);
-+		return True;
-+	}
-+
- 	FD_SET(ClientDGRAM,pset);
- 	sock_array[num++] = ClientDGRAM;
- 	*maxfd = MAX( *maxfd, ClientDGRAM);
- 
- 	/* Add in the 138 sockets on all the interfaces. */
- 	for (subrec = FIRST_SUBNET; subrec; subrec = NEXT_SUBNET_EXCLUDING_UNICAST(subrec)) {
-+		if (subrec->dgram_sock < 0 || subrec->dgram_sock >= FD_SETSIZE) {
-+			/* We have to ignore sockets outside FD_SETSIZE. */
-+			continue;
-+		}
- 		FD_SET(subrec->dgram_sock,pset);
- 		sock_array[num++] = subrec->dgram_sock;
- 		*maxfd = MAX( *maxfd, subrec->dgram_sock);
-@@ -1767,7 +1787,7 @@ bool listen_for_packets(bool run_election)
- 
- #ifndef SYNC_DNS
- 	dns_fd = asyncdns_fd();
--	if (dns_fd != -1) {
-+	if (dns_fd >= 0 && dns_fd < FD_SETSIZE) {
- 		FD_SET(dns_fd, &r_fds);
- 		maxfd = MAX( maxfd, dns_fd);
- 	}
-diff --git a/source/nsswitch/wb_common.c b/source/nsswitch/wb_common.c
-index a164621..4f76bd0 100644
---- a/source/nsswitch/wb_common.c
-+++ b/source/nsswitch/wb_common.c
-@@ -240,6 +240,12 @@ static int winbind_named_pipe_sock(const char *dir)
- 
- 		switch (errno) {
- 			case EINPROGRESS:
-+
-+				if (fd < 0 || fd >= FD_SETSIZE) {
-+					errno = EBADF;
-+					goto error_out;
-+				}
-+
- 				FD_ZERO(&w_fds);
- 				FD_SET(fd, &w_fds);
- 				tv.tv_sec = CONNECT_TIMEOUT - wait_time;
-@@ -383,7 +389,13 @@ int winbind_write_sock(void *buffer, int count, int recursing, int need_priv)
- 	while(nwritten < count) {
- 		struct timeval tv;
- 		fd_set r_fds;
--		
-+
-+		if (winbindd_fd < 0 || winbindd_fd >= FD_SETSIZE) {
-+			errno = EBADF;
-+			winbind_close_sock();
-+			return -1;
-+		}
-+
- 		/* Catch pipe close on other end by checking if a read()
- 		   call would not block by calling select(). */
- 
-@@ -443,7 +455,13 @@ int winbind_read_sock(void *buffer, int count)
- 	while(nread < count) {
- 		struct timeval tv;
- 		fd_set r_fds;
--		
-+
-+		if (winbindd_fd < 0 || winbindd_fd >= FD_SETSIZE) {
-+			errno = EBADF;
-+			winbind_close_sock();
-+			return -1;
-+		}
-+
- 		/* Catch pipe close on other end by checking if a read()
- 		   call would not block by calling select(). */
- 
-diff --git a/source/printing/printing.c b/source/printing/printing.c
-index a9272eb..c3b8c61 100644
---- a/source/printing/printing.c
-+++ b/source/printing/printing.c
-@@ -1407,6 +1407,11 @@ void start_background_queue(void)
- 		exit(1);
- 	}
- 
-+	if (pause_pipe[1] < 0 || pause_pipe[1] >= FD_SETSIZE) {
-+		DEBUG(5,("start_background_queue: pipe fd out of range.\n"));
-+		exit(1);
-+	}
-+
- 	background_lpq_updater_pid = sys_fork();
- 
- 	if (background_lpq_updater_pid == -1) {
-diff --git a/source/smbd/dnsregister.c b/source/smbd/dnsregister.c
-index f02739e..3c689b9 100644
---- a/source/smbd/dnsregister.c
-+++ b/source/smbd/dnsregister.c
-@@ -125,6 +125,9 @@ void dns_register_smbd(struct dns_reg_state ** dns_state_ptr,
- 	 */
- 	if (dns_state->srv_ref != NULL) {
- 		mdnsd_conn_fd = DNSServiceRefSockFD(dns_state->srv_ref);
-+		if (mdnsd_conn_fd < 0 || mdnsd_conn_fd >= FD_SETSIZE) {
-+			return;
-+		}
- 		FD_SET(mdnsd_conn_fd, listen_set);
- 		return;
- 	}
-@@ -156,6 +159,9 @@ void dns_register_smbd(struct dns_reg_state ** dns_state_ptr,
- 	}
- 
- 	mdnsd_conn_fd = DNSServiceRefSockFD(dns_state->srv_ref);
-+	if (mdnsd_conn_fd < 0 || mdnsd_conn_fd >= FD_SETSIZE) {
-+		return;
-+	}
- 	FD_SET(mdnsd_conn_fd, listen_set);
- 	*maxfd = MAX(*maxfd, mdnsd_conn_fd);
- 	*timeout = timeval_zero();
-diff --git a/source/smbd/oplock.c b/source/smbd/oplock.c
-index a07d05d..5ae3fdf 100644
---- a/source/smbd/oplock.c
-+++ b/source/smbd/oplock.c
-@@ -241,7 +241,10 @@ bool downgrade_oplock(files_struct *fsp)
- int oplock_notify_fd(void)
- {
- 	if (koplocks) {
--		return koplocks->notification_fd;
-+		int fd = koplocks->notification_fd;
-+		if (fd < 0 || fd >= FD_SETSIZE) {
-+			return -1;
-+		}
- 	}
- 
- 	return -1;
-diff --git a/source/smbd/oplock_irix.c b/source/smbd/oplock_irix.c
-index 8c287c9..6e86fac 100644
---- a/source/smbd/oplock_irix.c
-+++ b/source/smbd/oplock_irix.c
-@@ -284,6 +284,11 @@ struct kernel_oplocks *irix_init_kernel_oplocks(void)
- 		return False;
- 	}
- 
-+	if (pfd[0] < 0 || pfd[0] >= FD_SETSIZE) {
-+		DEBUG(0,("setup_kernel_oplock_pipe: fd out of range.\n"));
-+		return False;
-+	}
-+
- 	oplock_pipe_read = pfd[0];
- 	oplock_pipe_write = pfd[1];
- 
-diff --git a/source/smbd/process.c b/source/smbd/process.c
-index 403c7c6..9b8f29b 100644
---- a/source/smbd/process.c
-+++ b/source/smbd/process.c
-@@ -698,7 +698,7 @@ static void async_processing(fd_set *pfds)
- 
- static int select_on_fd(int fd, int maxfd, fd_set *fds)
- {
--	if (fd != -1) {
-+	if (fd != -1 && fd < FD_SETSIZE) {
- 		FD_SET(fd, fds);
- 		maxfd = MAX(maxfd, fd);
- 	}
-diff --git a/source/smbd/server.c b/source/smbd/server.c
-index 5129484..a670334 100644
---- a/source/smbd/server.c
-+++ b/source/smbd/server.c
-@@ -209,7 +209,13 @@ static bool open_sockets_inetd(void)
- 	/* Started from inetd. fd 0 is the socket. */
- 	/* We will abort gracefully when the client or remote system 
- 	   goes away */
--	smbd_set_server_fd(dup(0));
-+	int fd = dup(0);
-+
-+	if (fd < 0 || fd >= FD_SETSIZE) {
-+		return false;
-+	}
-+
-+	smbd_set_server_fd(fd);
- 	
- 	/* close our standard file descriptors */
- 	close_low_fds(False); /* Don't close stderr */
-@@ -436,7 +442,8 @@ static bool open_sockets_smbd(bool is_daemon, bool interactive, const char *smb_
- 							num_sockets == 0 ? 0 : 2,
- 							ifss,
- 							true);
--				if(s == -1) {
-+				if(s < 0 || s >= FD_SETSIZE) {
-+					close(s);
- 					continue;
- 				}
- 
-@@ -516,7 +523,7 @@ static bool open_sockets_smbd(bool is_daemon, bool interactive, const char *smb_
- 						num_sockets == 0 ? 0 : 2,
- 						&ss,
- 						true);
--				if (s == -1) {
-+				if (s < 0 || s >= FD_SETSIZE) {
- 					continue;
- 				}
- 
-@@ -709,6 +716,7 @@ static bool open_sockets_smbd(bool is_daemon, bool interactive, const char *smb_
- 			struct sockaddr addr;
- 			socklen_t in_addrlen = sizeof(addr);
- 			pid_t child = 0;
-+			int fd;
- 
- 			s = -1;
- 			for(i = 0; i < num_sockets; i++) {
-@@ -721,16 +729,21 @@ static bool open_sockets_smbd(bool is_daemon, bool interactive, const char *smb_
- 				}
- 			}
- 
--			smbd_set_server_fd(accept(s,&addr,&in_addrlen));
--
--			if (smbd_server_fd() == -1 && errno == EINTR)
-+			fd = accept(s,&addr,&in_addrlen);
-+			if (fd == -1 && errno == EINTR)
- 				continue;
--
--			if (smbd_server_fd() == -1) {
-+			if (fd == -1) {
- 				DEBUG(2,("open_sockets_smbd: accept: %s\n",
- 					 strerror(errno)));
- 				continue;
- 			}
-+			if (fd < 0 || fd >= FD_SETSIZE) {
-+				DEBUG(2,("open_sockets_smbd: bad fd %d\n",
-+					fd ));
-+				continue;
-+			}
-+
-+			smbd_set_server_fd(fd);
- 
- 			/* Ensure child is set to blocking mode */
- 			set_blocking(smbd_server_fd(),True);
-diff --git a/source/utils/smbfilter.c b/source/utils/smbfilter.c
-index 1e22a40..45f9207 100644
---- a/source/utils/smbfilter.c
-+++ b/source/utils/smbfilter.c
-@@ -162,8 +162,8 @@ static void filter_child(int c, struct sockaddr_storage *dest_ss)
- 		int num;
- 		
- 		FD_ZERO(&fds);
--		if (s != -1) FD_SET(s, &fds);
--		if (c != -1) FD_SET(c, &fds);
-+		if (s >= 0 && s < FD_SETSIZE) FD_SET(s, &fds);
-+		if (c >= 0 && c < FD_SETSIZE) FD_SET(c, &fds);
- 
- 		num = sys_select_intr(MAX(s+1, c+1),&fds,NULL,NULL,NULL);
- 		if (num <= 0) continue;
-@@ -235,6 +235,10 @@ static void start_filter(char *desthost)
- 		struct sockaddr_storage ss;
- 		socklen_t in_addrlen = sizeof(ss);
- 		
-+		if (s < 0 || s >= FD_SETSIZE) {
-+			break;
-+		}
-+
- 		FD_ZERO(&fds);
- 		FD_SET(s, &fds);
- 
-diff --git a/source/winbindd/winbindd.c b/source/winbindd/winbindd.c
-index 1d618e2..6b5c251 100644
---- a/source/winbindd/winbindd.c
-+++ b/source/winbindd/winbindd.c
-@@ -836,7 +836,8 @@ static void process_loop(void)
- 	listen_sock = open_winbindd_socket();
- 	listen_priv_sock = open_winbindd_priv_socket();
- 
--	if (listen_sock == -1 || listen_priv_sock == -1) {
-+	if (listen_sock < 0 || listen_sock >= FD_SETSIZE ||
-+			listen_priv_sock < 0 || listen_priv_sock >= FD_SETSIZE) {
- 		perror("open_winbind_socket");
- 		exit(1);
- 	}
-@@ -861,6 +862,9 @@ static void process_loop(void)
- 
- 	FD_ZERO(&r_fds);
- 	FD_ZERO(&w_fds);
-+
-+	/* We check the range for listen_sock and
-+	   listen_priv_sock above. */
- 	FD_SET(listen_sock, &r_fds);
- 	FD_SET(listen_priv_sock, &r_fds);
- 
-@@ -890,6 +894,12 @@ static void process_loop(void)
- 	}
- 
- 	for (ev = fd_events; ev; ev = ev->next) {
-+		if (ev->fd < 0 || ev->fd >= FD_SETSIZE) {
-+			/* Ignore here - event_add_to_select_args
-+			   should make this impossible. */
-+			continue;
-+		}
-+
- 		if (ev->flags & EVENT_FD_READ) {
- 			FD_SET(ev->fd, &r_fds);
- 			maxfd = MAX(ev->fd, maxfd);
-diff --git a/source/winbindd/winbindd_dual.c b/source/winbindd/winbindd_dual.c
-index ff004f2..b30ec20 100644
---- a/source/winbindd/winbindd_dual.c
-+++ b/source/winbindd/winbindd_dual.c
-@@ -1250,6 +1250,12 @@ static bool fork_domain_child(struct winbindd_child *child)
- 		return False;
- 	}
- 
-+	if (fdpair[0] < 0 || fdpair[0] >= FD_SETSIZE) {
-+		DEBUG(0, ("fork_domain_child: bad fd range (%d)\n", fdpair[0]));
-+		errno = EBADF;
-+		return False;
-+	}
-+
- 	ZERO_STRUCT(state);
- 	state.pid = sys_getpid();
- 
-@@ -1405,6 +1411,7 @@ static bool fork_domain_child(struct winbindd_child *child)
- 		message_dispatch(winbind_messaging_context());
- 
- 		FD_ZERO(&read_fds);
-+		/* We check state.sock against FD_SETSIZE above. */
- 		FD_SET(state.sock, &read_fds);
- 
- 		ret = sys_select(state.sock + 1, &read_fds, NULL, NULL, tp);
--- 
-1.6.4.2
-
diff --git a/package/samba/samba-add-check-for-__use_bsd.patch b/package/samba/samba-add-check-for-__use_bsd.patch
deleted file mode 100644
index a4c7109..0000000
--- a/package/samba/samba-add-check-for-__use_bsd.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- a/source/client/mount.cifs.c	2009-04-01 13:48:54.000000000 +0200
-+++ b/source/client/mount.cifs.c	2009-04-20 12:59:57.000000000 +0200
-@@ -100,6 +100,7 @@
- 
- /* glibc doesn't have strlcpy, strlcat. Ensure we do. JRA. We
-  * don't link to libreplace so need them here. */
-+#if defined(__GLIBC__) && !(defined(__UCLIBC__) && defined(__USE_BSD))
- 
- /* like strncpy but does not 0 fill the buffer and always null
-  *    terminates. bufsize is the size of the destination buffer */
-@@ -181,6 +182,7 @@
- 	SAFE_FREE(mountpassword);
- 	exit(EX_USAGE);
- }
-+#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* caller frees username if necessary */
- static char * getusername(void) {
diff --git a/package/samba/samba-do-not-check-glibc-version.patch b/package/samba/samba-do-not-check-glibc-version.patch
deleted file mode 100644
index c5e3cd4..0000000
--- a/package/samba/samba-do-not-check-glibc-version.patch
+++ /dev/null
@@ -1,104 +0,0 @@
---- a/source/configure	2009-04-01 14:19:36.000000000 +0200
-+++ b/source/configure	2009-04-20 13:05:12.000000000 +0200
-@@ -44061,90 +44061,8 @@
- 
- rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
- 
--#
--#
--#
--case "$host_os" in
--    *linux*)
--       # glibc <= 2.3.2 has a broken getgrouplist
--       if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&5
--$as_echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }; }
--else
--  cat >conftest.$ac_ext <<_ACEOF
--/* confdefs.h.  */
--_ACEOF
--cat confdefs.h >>conftest.$ac_ext
--cat >>conftest.$ac_ext <<_ACEOF
--/* end confdefs.h.  */
--
--#include <unistd.h>
--#include <sys/utsname.h>
--main() {
--       /* glibc up to 2.3 has a broken getgrouplist */
--#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
--       int libc_major = __GLIBC__;
--       int libc_minor = __GLIBC_MINOR__;
--
--       if (libc_major < 2)
--              exit(1);
--       if ((libc_major == 2) && (libc_minor <= 3))
--              exit(1);
--#endif
--       exit(0);
--}
--
--_ACEOF
--rm -f conftest$ac_exeext
--if { (ac_try="$ac_link"
--case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
--$as_echo "$ac_try_echo") >&5
--  (eval "$ac_link") 2>&5
--  ac_status=$?
--  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
--  { (case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
--$as_echo "$ac_try_echo") >&5
--  (eval "$ac_try") 2>&5
--  ac_status=$?
--  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); }; }; then
--  linux_getgrouplist_ok=yes
--else
--  $as_echo "$as_me: program exited with status $ac_status" >&5
--$as_echo "$as_me: failed program was:" >&5
--sed 's/^/| /' conftest.$ac_ext >&5
--
--( exit $ac_status )
--linux_getgrouplist_ok=no
--fi
--rm -rf conftest.dSYM
--rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
--fi
--
--
--       if test x"$linux_getgrouplist_ok" = x"yes"; then
--
--cat >>confdefs.h <<\_ACEOF
--#define HAVE_GETGROUPLIST 1
--_ACEOF
--
--       fi
--       ;;
--    *)
-+# Stripped glibc test which is not needed for uClibc
-+linux_getgrouplist_ok=yes
- 
- for ac_func in getgrouplist
- do
-@@ -44246,8 +44164,6 @@
- fi
- done
- 
--       ;;
--esac
- 
- #
- # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX
diff --git a/package/samba/samba-fix-client-mtab.patch b/package/samba/samba-fix-client-mtab.patch
deleted file mode 100644
index 21e7158..0000000
--- a/package/samba/samba-fix-client-mtab.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/source/client/mtab.c
-+++ b/source/client/mtab.c
-@@ -31,6 +31,8 @@
- #include <unistd.h>
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
- #include <sys/time.h>
- #include <time.h>
- #include <fcntl.h>
diff --git a/package/samba/samba-fix-mount.cifs.patch b/package/samba/samba-fix-mount.cifs.patch
deleted file mode 100644
index 90bff23..0000000
--- a/package/samba/samba-fix-mount.cifs.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- a/source/client/mount.cifs.c
-+++ b/source/client/mount.cifs.c
-@@ -138,6 +138,7 @@ static size_t strlcat(char *d, const cha
- 	return ret;
- }
- #endif
-+#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* BB finish BB
- 
-@@ -178,7 +179,6 @@ static void mount_cifs_usage(void)
- 	SAFE_FREE(mountpassword);
- 	exit(EX_USAGE);
- }
--#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* caller frees username if necessary */
- static char * getusername(void) {
diff --git a/package/samba/samba-getgrouplist.patch b/package/samba/samba-getgrouplist.patch
deleted file mode 100644
index e98d9cd..0000000
--- a/package/samba/samba-getgrouplist.patch
+++ /dev/null
@@ -1,41 +0,0 @@
---- a/source/configure.in	2009-04-01 13:48:54.000000000 +0200
-+++ b/source/configure.in	2009-04-20 13:08:42.000000000 +0200
-@@ -1219,38 +1219,6 @@
- AC_DEFINE(HAVE_PRCTL, 1, [Whether prctl is available]),[])
- 
- #
--#
--#
--case "$host_os" in
--    *linux*)
--       # glibc <= 2.3.2 has a broken getgrouplist
--       AC_TRY_RUN([
--#include <unistd.h>
--#include <sys/utsname.h>
--main() {
--       /* glibc up to 2.3 has a broken getgrouplist */
--#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
--       int libc_major = __GLIBC__;
--       int libc_minor = __GLIBC_MINOR__;
--
--       if (libc_major < 2)
--              exit(1);
--       if ((libc_major == 2) && (libc_minor <= 3))
--              exit(1);
--#endif
--       exit(0);
--}
--], [linux_getgrouplist_ok=yes], [linux_getgrouplist_ok=no])
--       if test x"$linux_getgrouplist_ok" = x"yes"; then
--          AC_DEFINE(HAVE_GETGROUPLIST, 1, [Have good getgrouplist])
--       fi
--       ;;
--    *)
--       AC_CHECK_FUNCS(getgrouplist)
--       ;;
--esac
--
--#
- # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX
- #
- 
diff --git a/package/samba/samba-remove-legacy-index.patch b/package/samba/samba-remove-legacy-index.patch
deleted file mode 100644
index 49a3b7d..0000000
--- a/package/samba/samba-remove-legacy-index.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/source/registry/reg_perfcount.c
-+++ b/source/registry/reg_perfcount.c
-@@ -616,14 +616,14 @@ static bool _reg_perfcount_add_counter(P
- 	obj = NULL;
- 	memset(buf, 0, PERFCOUNT_MAX_LEN);
- 	memcpy(buf, data.dptr, data.dsize);
--	begin = index(buf, '[');
--	end = index(buf, ']');
-+	begin = strchr(buf, '[');
-+	end = strchr(buf, ']');
- 	if(begin == NULL || end == NULL)
- 		return False;
- 	start = begin+1;
- 
- 	while(start < end) {
--		stop = index(start, ',');
-+		stop = strchr(start, ',');
- 		if(stop == NULL)
- 			stop = end;
- 		*stop = '\0';
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index f61444d..2cc052b 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -3,11 +3,11 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.3.14
+SAMBA_VERSION:=3.5.8
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 
-SAMBA_SUBDIR = source
+SAMBA_SUBDIR = source3
 SAMBA_AUTORECONF = NO
 
 SAMBA_INSTALL_STAGING = YES
@@ -21,7 +21,6 @@ SAMBA_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),avahi) \
 	$(if $(BR2_PACKAGE_SAMBA_GAMIN),gamin)
 
-
 SAMBA_CONF_ENV = \
 	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
 	samba_cv_USE_SETREUID=yes \
@@ -31,11 +30,11 @@ SAMBA_CONF_ENV = \
 	samba_cv_HAVE_FCNTL_LOCK=yes \
 	samba_cv_HAVE_SECURE_MKSTEMP=yes \
 	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
-	samba_cv_fpie=no \
+	libreplace_cv_HAVE_SECURE_MKSTEMP=yes \
+	libreplace_cv_HAVE_MMAP=yes\
 	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
 
-
 SAMBA_CONF_OPT = \
 	--localstatedir=/var \
 	--with-piddir=/var/run \
@@ -48,8 +47,6 @@ SAMBA_CONF_OPT = \
 	--disable-static \
 	--enable-shared \
 	--enable-shared-libs \
-	--disable-pie \
-	--disable-relro \
 	--disable-dnssd \
 	\
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),--enable-avahi,--disable-avahi) \
@@ -67,19 +64,25 @@ SAMBA_CONF_OPT = \
 	$(if $(BR2_PACKAGE_SAMBA_CIFS),--with-cifsmount,--without-cifsmount) \
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),--with-readline=$(STAGING_DIR)) \
 	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR)) \
-	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
-
+	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind) \
+	$(if $(BR2_PACKAGE_SAMBA_NSS_WRAPPER),--enable-nss-wrapper,--disable-nss-wrapper) \
+	$(if $(BR2_PACKAGE_SAMBA_SOCKET_WRAPPER),--enable-socket-wrapper,--disable-socket-wrapper) \
+	$(if $(BR2_PACKAGE_SAMBA_QUOTA),--with-quotas,--without-quotas) \
+	$(if $(BR2_PACKAGE_SAMBA_AIO),--with-aio-support,--without-aio-support) \
 
 SAMBA_INSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
-	installlibs installservers installbin installscripts \
+	installlibs installservers installbin installscripts installmodules \
+	$(if $(BR2_HAVE_DOCUMENTATION),installman) \
+	$(if $(BR2_ENABLE_LOCALE),installmo) \
 	$(if $(BR2_PACKAGE_SAMBA_CIFS),installcifsmount) \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),installswat)
 
-
 SAMBA_UNINSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
-	uninstalllibs uninstallservers uninstallbin uninstallscripts \
+	uninstalllibs uninstallservers uninstallbin uninstallscripts uninstallmodules\
+	$(if $(BR2_HAVE_DOCUMENTATION),uninstallman) \
+	$(if $(BR2_ENABLE_LOCALE),uninstallmo) \
 	$(if $(BR2_PACKAGE_SAMBA_CIFS),uninstallcifsmount) \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),uninstallswat)
 
-- 
1.7.3.2
