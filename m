From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Aug 2017 22:51:50 +0200
Subject: [Buildroot] [PATCH v3] util-linux: add menu items for login
 utilities
In-Reply-To: <20170825031931.6768-1-casantos@datacom.ind.br>
References: <20170824232403.1a196068@windsurf>
 <20170825031931.6768-1-casantos@datacom.ind.br>
Message-ID: <7fd32162-7c24-85bd-9c55-d2a492aa682f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Carlos,

On 25-08-17 05:19, Carlos Santos wrote:
> This change extends to the login utilities the current policy of having
> a selection item in the configuration menu for each utility that has an
> --enable/--disable knob in the "configure" script:
> 
> - add selection items for login, runuser, su and sulogin (there was
>   already an item for "last")
> - move "login utilities" to Config.in.legacy
> - make "login utilities" select last, login, runuser, su and sulogin

 The problem with these changes is combinatorial explosion, leading to...

[snip]
> +config BR2_PACKAGE_UTIL_LINUX_SU
> +	bool "su"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  Run a command with substitute user and group ID
[snip]
>  # Install PAM configuration files
> -ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU),y)
>  define UTIL_LINUX_INSTALL_PAMFILES
>  	$(INSTALL) -m 0644 package/util-linux/su.pam \
>  		$(TARGET_DIR)/etc/pam.d/su

 So su does not select PAM, but it does select a PAM file?

 Well, I guess it indeed doesn't strictly require PAM, but we should probably
only intall the PAM file if LINUX_PAM is selected as well, no?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
