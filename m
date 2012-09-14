From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Sep 2012 11:28:32 +0200
Subject: [Buildroot] [PATCH 1/2] openssh: add linux-pam support
In-Reply-To: <1344790876-27962-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sun, 12 Aug 2012 13:01:15 -0400")
References: <1344790876-27962-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87txv1osvz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

 Danomi> ---
 Danomi>  package/openssh/openssh.mk |    5 +++++
 Danomi>  1 file changed, 5 insertions(+)

 Danomi> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
 Danomi> index 0878fce..815ed33 100644
 Danomi> --- a/package/openssh/openssh.mk
 Danomi> +++ b/package/openssh/openssh.mk
 Danomi> @@ -12,6 +12,11 @@ OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 
 Danomi>  OPENSSH_DEPENDENCIES = zlib openssl
 
 Danomi> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 Danomi> +OPENSSH_DEPENDENCIES += linux-pam
 Danomi> +OPENSSH_CONF_OPT += --with-pam
 Danomi> +endif

What configurations did you test this with? It seems to break here with
the internal toolchain because pthread.h somehow gets included:

output/host/usr/bin/arm-linux-gcc -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wno-pointer-sign -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -fno-builtin-memset  -I. -I.  -DSSHDIR=\"/etc\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/lib/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/lib/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/lib/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/lib/ssh-pkcs11-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/empty\"  -DHAVE_CONFIG_H -c auth-pam.c
auth-pam.c:171: error: static declaration of ?pthread_exit? follows non-static declaration
/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/pthread.h:236: error: previous declaration of ?pthread_exit? was here
auth-pam.c:178: error: conflicting types for ?pthread_create?
/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/pthread.h:227: error: previous declaration of ?pthread_create? was here
auth-pam.c:204: error: conflicting types for ?pthread_cancel?
/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/pthread.h:487:
error: previous declaration of ?pthread_cancel? was here


-- 
Bye, Peter Korsgaard
