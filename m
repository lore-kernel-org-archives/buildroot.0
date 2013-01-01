From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jan 2013 15:36:31 +0100
Subject: [Buildroot] [PATCH] efl/libecore: fix build with gcrypt
In-Reply-To: <1357046638-2195-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 1 Jan 2013 14:23:58 +0100")
References: <1357046638-2195-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqvxrmvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When building with gnutls, libecore also needs libgcrypt.
 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/4da454d6414cf8f4e638defae9b793fb46a0a072/build-end.log

 Thomas> While we're at it, also explicit the --enable-openssl /
 Thomas> --disable-openssl depending on whether openssl is available or not.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/efl/libecore/libecore.mk |    8 +++++++-
 Thomas>  1 file changed, 7 insertions(+), 1 deletion(-)

 Thomas> diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
 Thomas> index 0220017..e824bfa 100644
 Thomas> --- a/package/efl/libecore/libecore.mk
 Thomas> +++ b/package/efl/libecore/libecore.mk
 Thomas> @@ -36,10 +36,16 @@ endif
 
 Thomas>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
 Thomas>  LIBECORE_DEPENDENCIES += openssl
 Thomas> +LIBECORE_CONF_OPT += --enable-openssl
 Thomas> +else
 Thomas> +LIBECORE_CONF_OPT += --disable-openssl
 Thomas>  endif
 
 Thomas>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
 Thomas> -LIBECORE_DEPENDENCIES += gnutls
 Thomas> +LIBECORE_DEPENDENCIES += gnutls libgcrypt

No, we shouldn't pull in dependencies behind the users' back. I've
changed it to only activate when both gnutls and libgcrypt are present.

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
