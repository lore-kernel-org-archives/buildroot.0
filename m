From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 26 Dec 2014 22:50:13 +0100
Subject: [Buildroot] [PATCH 1/2] package/lftp: don't use host's path
In-Reply-To: <20141226201143.143896ff@free-electrons.com>
References: <1419614983-8105-1-git-send-email-romain.naour@openwide.fr>
 <20141226201143.143896ff@free-electrons.com>
Message-ID: <549DD815.8080003@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 26/12/2014 20:11, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Fri, 26 Dec 2014 18:29:42 +0100, Romain Naour wrote:
>> lftp try to link with -L/usr/lib/lftp/$(LFTP_VERSION) if
>> DESTDIR is not set.
>>
>> When DESTDIR is set to STAGING_DIR, it link with
>> -L$(STAGING_DIR)/usr/lib/lftp/$(LFTP_VERSION)
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/lftp/lftp.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
>> index 1586579..73e3087 100644
>> --- a/package/lftp/lftp.mk
>> +++ b/package/lftp/lftp.mk
>> @@ -45,6 +45,10 @@ LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FTP) += proto-ftp.so
>>  LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_HTTP) += proto-http.so
>>  LFTP_MODULES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_SFTP) += proto-sftp.so
>>  
>> +# Set DESTDIR to STAGING_DIR during the build to avoid linking
>> +# with -L/usr/lib/lftp/$(LFTP_VERSION)
>> +LFTP_MAKE_ENV += DESTDIR="$(STAGING_DIR)"
> Can we patch lftp's build system instead, and submit the patch upstream?
>
>
The problem come from proto modules build that use the same variable $(pkgverlibdir)
(which is set to /usr/lib/lftp/4.5.5)for linking and to set the rpath:

/home/naourr/git/buildroot/test/liblinear/host/usr/bin/i686-pc-linux-gnu-g++ [...]
-rpath /usr/lib/lftp/4.5.5 -s -o proto-ftp.la -rpath /usr/lib/lftp/4.5.5 ftpclass.lo
[...] -L/usr/lib/lftp/4.5.5 [...]

At first sight, one solution is to set $(DESTDIR) to $(STAGING_DIR)

proto_ftp_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la
proto_http_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la $(EXPAT_LIBS) $(ZLIB)
proto_fish_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
proto_sftp_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
cmd_torrent_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la

But I think we can remove -L$(DESTDIR)$(pkgverlibdir) since it doesn't seem to be useful.
The build succeed (without paranoid toolchain) even with /usr/lib/lftp/4.5.5 or
$(STAGING_DIR)/usr/lib/lftp/4.5.5 which both doesn't exist.

Best regards,
Romain
