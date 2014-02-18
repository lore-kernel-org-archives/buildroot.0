From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 19 Feb 2014 00:18:42 +0100
Subject: [Buildroot] [PATCH v2 1/1] ncftp: fix cross-compilation test
In-Reply-To: <20140218235950.6bc82d6e@skate>
References: <1392762712-29657-1-git-send-email-romain.naour@openwide.fr>
 <20140218235950.6bc82d6e@skate>
Message-ID: <5303EA52.8030803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 18/02/2014 23:59, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Tue, 18 Feb 2014 23:31:52 +0100, Romain Naour wrote:
>> The cross-compilation test is based on the ability to run
>> a test program on the host, which is wrong.
>>
>> If it runs, then the configure script concludes
>> that we're doing native compilation,
>> if it doesn't run, we're doing cross-compilation.
>>
>> Replace it with a more correct test.
>>
>> Fixes
>> http://autobuild.buildroot.net/results/969/969a49ae97a50634ea846a82b9c360e4fb020ace/build-end.log
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>> v2:
>> Add a cross-compilation test suggested by Thomas Petazzoni.
> Can you instead test the following patch:
>
> diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
> index ff6c70a..c9068b7 100644
> --- a/package/ncftp/ncftp.mk
> +++ b/package/ncftp/ncftp.mk
> @@ -11,6 +11,14 @@ NCFTP_TARGET_BINS = ncftp
>   NCFTP_LICENSE = Clarified Artistic License
>   NCFTP_LICENSE_FILES = doc/LICENSE.txt
>   
> +NCFTP_DEPENDENCIES = host-autoconf
> +
> +define NCFTP_RUN_AUTOCONF
> +       (cd $(@D); $(HOST_DIR)/usr/bin/autoconf -I$(@D)/autoconf_local/)
> +endef
> +
> +NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
> +
>   ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
>          NCFTP_TARGET_BINS += ncftpget
>   endif
>
Ok, it works.
The configure script is regenerated correctly.

I had problems using NCFTP_AUTORECONF = YES
what is the difference?

Thank you,
Romain Naour
