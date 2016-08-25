From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 10:33:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgpg-error: optionally
 depends on gettext
In-Reply-To: <20160824231003.29262-1-arnout@mind.be>
References: <20160824231003.29262-1-arnout@mind.be>
Message-ID: <20160825103327.148da292@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 01:10:02 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +ifeq ($(BR2_NEEDS_GETTEXT),y)
> +LIBGPG_ERROR_DEPENDENCIES += gettext
> +endif

If you add gettext as a dependency, then the Config.in should be adjust
accordingly, otherwise the mechanism that checks when a package gets
built that it is really selected in the configuration will abort the
build.

The manual at
https://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages
has some details on the gettext interaction:

"""

Packages that need gettext only when locale support is enabled should:

 - use select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE in
   the Config.in file;

 - use $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) in the package
   DEPENDENCIES variable in the .mk file. 

Packages that unconditionally need gettext (which should be very rare)
should:

 - use select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT in the
   Config.in file;

 - use $(if $(BR2_NEEDS_GETTEXT),gettext) in the package
   DEPENDENCIES variable in the .mk file.

"""

Then I believe there's possibly a *third* case, which the manual
doesn't describe, but that we should document: packages that *may* use
gettext if available, but which can work without it. In this case:

ifeq ($(BR2_PACKAGE_GETTEXT),y)
<pkg>_DEPENDENCIES += gettext
endif

would be the correct solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
