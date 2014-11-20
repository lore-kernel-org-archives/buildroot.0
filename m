From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 20 Nov 2014 19:37:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-19
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
Message-ID: <XnsA3EBC78DF44F4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141120094407.4b487379 at free-
electrons.com:

>>       xtensa |                  clamav-0.98.4 | NOK | 
http://autobuild.buildroot.net/results/1a46e53cf892534f1b3a16c249fa71048529
0b5a/
>>          arm |                  clamav-0.98.4 | NOK | 
http://autobuild.buildroot.net/results/e732d1bac8fe68fd8bba50e4e9d908be3d99
6c83/
> 
>   CCLD     clamscan
> ../libclamav/.libs/libclamav.so: undefined reference to `bzDecompress'
> ../libclamav/.libs/libclamav.so: undefined reference to 
`bzDecompressInit'
> ../libclamav/.libs/libclamav.so: undefined reference to `bzDecompressEnd'
> collect2: error: ld returned 1 exit status
> 
> Bernd, can you have a look?

Hi,

I still[1] can not reproduce the bug on my machine. Apparently it happens 
only on Peter?s autobuilder: http://autobuild.buildroot.net/?reason=clamav-
0.98.4.

@Peter: Could you please try this patch locally on your autobuilder?

--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -16,6 +16,7 @@ CLAMAV_DEPENDENCIES = openssl zlib $(if $(BR2
_NEEDS_GETTEXT_IF_LOCALE),gettext)

 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
+       LIBBZ2_PREFIX=$(STAGING_DIR)/usr \
        ac_cv_c_mmap_private=yes

 CLAMAV_CONF_OPTS = \


Regards, Bernd

[1] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/98686
