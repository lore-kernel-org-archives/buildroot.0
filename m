From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Oct 2016 21:13:57 +0200
Subject: [Buildroot] [PATCH 1/2] sudo: Add ldap support for sudoers rules
In-Reply-To: <1476893310-25852-1-git-send-email-cdf123@cdf123.net>
References: <1476893310-25852-1-git-send-email-cdf123@cdf123.net>
Message-ID: <ffe77538-4bad-a040-c0e3-fd745270a849@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Chris,

 Thank you for your patch. I have a few comments below. Can you fix and
resubmit? I have marked your patch as "Changes Requested" in our patch tracking
system so if you don't resubmit we will forget about it.

On 19-10-16 18:08, Chris Frederick wrote:
> Added Config.in options to enable/disable the option, and check options
> in sudo.mk to add openldap as a dependancy and compile with --with-ldap.
> 
> Signed-off-by: Chris Frederick <cdf123@cdf123.net>
> ---
>  package/sudo/Config.in | 12 ++++++++++++
>  package/sudo/sudo.mk   |  5 +++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index cbef15d..2e9e35a 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -9,3 +9,15 @@ config BR2_PACKAGE_SUDO
>  	  but still allow people to get their work done.
>  
>  	  http://www.sudo.ws/sudo/
> +
> +if BR2_PACKAGE_SUDO && BR2_PACKAGE_OPENLDAP
> +config BR2_PACKAGE_SUDO_LDAP

 As far as I know, there is no need to make this option configurable. Just
enable LDAP support when BR2_PACKASGE_OPENLDAP is selected, like you do for
postgresql.

> +	bool "ldap integration"
> +	depends on BR2_PACKAGE_SUDO
> +	help
> +	  Allows you to manage sudoers rules in a centralized ldap
> +	  directory.
> +
> +	  http://www.sudo.ws/man/1.8.15/sudoers.ldap.man.html
> +endif
> +
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index f28312a..b4d071c 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -30,6 +30,11 @@ else
>  SUDO_CONF_OPTS += --without-pam
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SUDO_LDAP),y)
> +SUDO_DEPENDENCIES += openldap
> +SUDO_CONF_OPTS += --with-ldap

 We also prefer to explicitly disable options, to avoid problems with e.g.
looking up on the host. So add

else
SUDO_CONF_OPTS += --without-ldap

or if that is not possible, a comment why not.

 Regards,
 Arnout

> +endif
> +
>  # mksigname/mksiglist needs to run on build host to generate source files
>  define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
>  	$(MAKE) $(HOST_CONFIGURE_OPTS) \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
