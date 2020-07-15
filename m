From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:57:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/maven-bin: new package
In-Reply-To: <20200618194327.94076-1-aduskett@gmail.com>
References: <20200618194327.94076-1-aduskett@gmail.com>
Message-ID: <20200715235702.72126e2b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jun 2020 12:43:27 -0700
aduskett at gmail.com wrote:

> Instead of using sed on the provided settings.xml, which would be very
> difficult to do, as the default settings file has the localRepository variable
> commented out,  a settings.xml file in package/maven-bin has the
> localRepository variable pre-set to the MAVEN_REPO_DIR environment variable.
> 
> Finally, maven-bin.mk provides the MAVEN environment variable helper,
> which provides all of the needed variables needed to invoke Maven in a single
> command, making it much easier to integrate packages that need to use Maven.
> 
> An example of using Maven with a package would be as such:
> 
> FOO_DEPENDENCIES = host-maven-bin
> 
> define FOO_BUILD_CMDS
>     cd $(@D) && $(MAVEN) compile
> endef
> 
> define FOO_INSTALL_TARGET_CMDS
>     $(INSTALL) -m 755 $(@D)/target/foo.jar $(TARGET_DIR)/usr/bin/foo.jar
> endef
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks for this contribution. Do you have a package that needs this and
that you intend to contribute to Buildroot ? It's always a bit annoying
to have host packages that are not used by anything.

Or is there at least some stupid package we could throw into a
br2-external in support/testing and have a runtime test case that
builds it with Maven ?


> diff --git a/package/maven-bin/Config.in b/package/maven-bin/Config.in
> new file mode 100644
> index 0000000000..95deedd371
> --- /dev/null
> +++ b/package/maven-bin/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_MAVEN_BIN
> +	bool "maven-bin"
> +	depends on BR2_PACKAGE_OPENJDK
> +	help
> +	  Apache Maven is a software project management and
> +	  comprehension tool. Based on the concept of a project object
> +	  model (POM), Maven can manage a project's build, reporting and
> +	  documentation from a central piece of information.
> +
> +	  https://github.com/apache/maven
> +
> +comment "maven-bin needs openjdk"
> +	depends on !BR2_PACKAGE_OPENJDK

Why do you have a Config.in option to enable a target package that
doesn't exist, since there's no maven-bin package, only host-maven-bin ?

> diff --git a/package/maven-bin/maven-bin.hash b/package/maven-bin/maven-bin.hash
> new file mode 100644
> index 0000000000..3673b33573
> --- /dev/null
> +++ b/package/maven-bin/maven-bin.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  26ad91d751b3a9a53087aefa743f4e16a17741d3915b219cf74112bf87a438c5  apache-maven-3.6.3-bin.tar.gz
> +sha256  8b79d3d26bfbfd31fc50b22b149c2ecd2863345abb62d15048157a6f2e774411  LICENSE
> diff --git a/package/maven-bin/maven-bin.mk b/package/maven-bin/maven-bin.mk
> new file mode 100644
> index 0000000000..1bf40b7d55
> --- /dev/null
> +++ b/package/maven-bin/maven-bin.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# host-maven-bin

Just maven-bin

> +#
> +################################################################################
> +
> +HOST_MAVEN_BIN_VERSION = 3.6.3
> +HOST_MAVEN_BIN_SOURCE = apache-maven-$(HOST_MAVEN_BIN_VERSION)-bin.tar.gz
> +HOST_MAVEN_BIN_SITE = https://www-us.apache.org/dist/maven/maven-3/$(HOST_MAVEN_BIN_VERSION)/binaries
> +HOST_MAVEN_BIN_LICENSE = Apache-2.0
> +HOST_MAVEN_BIN_LICENSE_FILES = LICENSE

Please use:

MAVEN_BIN_xyz

for all those variables. I know there's no target variant, but there's
no need to have a HOST_ prefix for those variables.

> +HOST_MAVEN_BIN_DEPENDENCIES = host-openjdk-bin
> +
> +# Maven is traditionally installed in it's own seperate directory in either

seperate -> separate

> +# usr/share/maven or /usr/lib/maven with the mvn binary symlinked to /usr/bin.
> +define HOST_MAVEN_BIN_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/usr/lib/maven
> +	mkdir -p $(HOST_DIR)/bin
> +	cp -dprf $(@D)/* $(HOST_DIR)/usr/lib/maven/
> +	ln -sf $(HOST_DIR)/usr/lib/maven/bin/mvn $(HOST_DIR)/bin/mvn
> +
> +# The settings.xml file sets the localRepository directory to the
> +# MAVEN_REPO_DIR environment variable.
> +	$(INSTALL) -D -m 755 $(HOST_MAVEN_BIN_PKGDIR)/settings.xml \
> +		$(HOST_DIR)/usr/lib/maven/conf/settings.xml
> +endef
> +
> +$(eval $(host-generic-package))
> +
> +# variables used by other packages
> +MAVEN = \
> +	JAVA_HOME="$(HOST_DIR)/usr/lib/jvm" \
> +	M2_HOME="$(HOST_DIR)/usr/lib/maven" \
> +	MAVEN_HOME="$(HOST_DIR)/usr/lib/maven" \
> +	MAVEN_REPO_DIR="$(BR2_DL_DIR)/maven-repo" \

This is not really going to solve the problem that maven works around
the Buildroot download infrastructure, if it downloads things by
itself. What is the plan regarding this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
