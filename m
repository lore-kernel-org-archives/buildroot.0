From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 22:22:53 +0100
Subject: [Buildroot] [BUILDROOT][PACKAGE][open62541][OPCUA] open62541
 integration in buildroot
In-Reply-To: <1071650519.1148307.1573142972518.JavaMail.zimbra@sepro-group.com>
References: <1071650519.1148307.1573142972518.JavaMail.zimbra@sepro-group.com>
Message-ID: <20191107222253.64938984@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Thanks for your contribution!

On Thu, 7 Nov 2019 17:09:32 +0100 (CET)
Yann Cardaillac <ycardaillac@sepro-group.com> wrote:

> We would like to offer our integration of package open62541 into buildroot. 
> 
> Open62541 is an opensource OPCUA stack, see [ https://open62541.org/ | https://open62541.org/ ] 

Thanks for contributing this, OPC-UA is apparently becoming a "hot"
topic, so having some OPC-UA implementations available in Buildroot is
definitely nice.

> I've add all option that I could find based on the documentation
> however I'm not an open62541 developper so there will probably be
> some changes regarding "select", "depends on" and uncompatible
> options. 

In fact, we generally don't want to support "all" options, but the ones
that make sense.

> Few of the options are not yet documented so I stored them under menu
> "open62541 undocumented/advanced build options". 
> 
> To improve we would need to have some help from open62541 devs. I
> will contact them in the nexts days. 
> 
> Until then please don't hesitate to give me some feedback. 

In terms of your patch submission, could you please use "git
send-email" instead of sending the e-mail as an attached file? This
allows to much more easily review your patch, and also to be able to
apply it with "git am", which facilitates the work of the Buildroot
maintainers.

Nevertheless, I'm quoting your patch below, and doing some initial
review comments:

> From e6a36dd2c0415cb8469a07ba2b1e78d386c7be04 Mon Sep 17 00:00:00 2001
> From: Yann CARDAILLAC <ycardaillac@sepro-group.com>
> Date: Thu, 7 Nov 2019 16:45:42 +0100
> Subject: [PATCH] add open62541 package

The commit title should be:

package/open62541: new package

> 
> as warned in the menu some options are undocumented or advanced build options and
> were not tested within this package.

We probably don't want these options exposed in Config.in.

> 
> Signed-off-by: Yann CARDAILLAC <ycardaillac@sepro-group.com>
> ---
>  package/Config.in              |   1 +
>  package/open62541/Config.in    | 264 +++++++++++++++++++++++++++++++++++++++++
>  package/open62541/open62541.mk |  38 ++++++

Please add an entry to the DEVELOPERS file for this package, and also
add package/open62541/open62541.hash with the hash of the tarball and
the hash of the license file. See other packages for examples.

>  3 files changed, 303 insertions(+)
>  create mode 100644 package/open62541/Config.in
>  create mode 100644 package/open62541/open62541.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f72c77b416..418cadbc49 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1663,6 +1663,7 @@ menu "Networking"
>  	source "package/nss-myhostname/Config.in"
>  	source "package/nss-pam-ldapd/Config.in"
>  	source "package/omniorb/Config.in"
> +	source "package/open62541/Config.in"
>  	source "package/openldap/Config.in"
>  	source "package/openmpi/Config.in"
>  	source "package/openpgm/Config.in"
> diff --git a/package/open62541/Config.in b/package/open62541/Config.in
> new file mode 100644
> index 0000000000..b4b31c25fe
> --- /dev/null
> +++ b/package/open62541/Config.in
> @@ -0,0 +1,264 @@
> +config BR2_PACKAGE_OPEN62541
> +	bool "open62541"

Did you test this package with ./utils/test-pkg to make sure it doesn't
have dependencies on specific toolchain features (threads, C++, etc.) ?

> +	help
> +	 open62541 (http://open62541.org) is an open source and free implementation of OPC UA (OPC Unified Architecture)

The indentation for the help text is one tab + 2 spaces, and lines
should be wrapped. Please run "make check-package" to verify such
coding style issues. They need to globally be fixed in your package.

> +
> +if BR2_PACKAGE_OPEN62541
> +
> +menu "oen62541 build options"
> +
> +config BR2_PACKAGE_OPEN62541_SET_UA_LOGLEVEL
> +	bool "set UA Log Level"
> +
> +if BR2_PACKAGE_OPEN62541_SET_UA_LOGLEVEL
> +
> +config BR2_PACKAGE_OPEN62541_UA_LOGLEVEL
> +	string "UA log level"
> +	default 400
> +	help
> +	 The SDK logs events of the level defined in UA_LOGLEVEL and above only. The logging event levels are as follows: 
> +	 600: Fatal, 500: Error, 400: Warning, 300: Info, 200: Debug, 100: Trace
> +
> +endif 

Do we really need a Config.in option for this ?

> +
> +config BR2_PACKAGE_OPEN62541_HAS_UA_MULTITHREADING
> +	bool "use multithreading"
> +	select BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_IMMUTABLE_NODES
> +
> +if BR2_PACKAGE_OPEN62541_HAS_UA_MULTITHREADING
> +
> +config BR2_PACKAGE_OPEN62541_UA_MULTITHREADING
> +
> +	string "UA multithreading level"
> +	default 0
> +	help
> +	 0-199: Multithreading support disabled, 
> +	 100-199: API functions marked with the UA_THREADSAFE-macro are protected internally with mutexes. 
> +	 Multiple threads are allowed to call these functions of the SDK at the same time without causing race conditions. 
> +	 Furthermore, this level support the handling of asynchronous method calls from external worker threads.
> +	 Greater than 200: Work is distributed to a number of internal worker threads. Those worker threads are created within the SDK. 
> +	 (EXPERIMENTAL FEATURE! Expect bugs.)

If I select level 162, what happens ?

We probably don't want a visible option for this, just disable
threading support when BR2_TOOLCHAIN_HAS_THREADS is disabled, and
enable thread support when BR2_TOOLCHAIN_HAS_THREADS is enabled.

> +
> +endif
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_EXAMPLES

Remove "BOOL_UA" from the name, you can also drop the "BUILD", so just:

config BR2_PACKAGE_OPEN62541_EXAMPLES

Please fix globally.


> +	bool "build examples"
> +	help
> +	 Compile example servers and clients from examples/*.c.
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_UNIT_TESTS
> +	bool "Compile unit test"
> +	help 
> +	 Compile unit tests. The tests can be executed with make test

We normally don't build tests, so please disable them unconditionally.

> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_SELFSIGNED_CERTIFICATE
> +	bool "self signed certificate for the server"
> +	depends on BR2_PACKAGE_OPENSSL 

Enable this in the .mk file when BR2_PACKAGE_OPENSSL=y

> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_SUBSCRIPTIONS
> +    bool "Enable subscriptions"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_SUBSCRIPTIONS_EVENTS 
> +	bool "EXPERIMENTAL Enable the use of events for subscriptions"
> +	help
> +	 Enable the use of events for subscriptions. This is a new feature and currently marked as EXPERIMENTAL.
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_METHODCALLS
> +    bool "Enable the Method service set"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_NODEMANAGEMENT
> +    bool "dynamic add and rm of nodes at runtime"
> +    help
> +     Enable dynamic addition and removal of nodes at runtime
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_AMALGAMATION
> +	bool "Not recommended : single file release"
> +    help
> +     Compile a single-file release into the files open62541.c and open62541.h. Not recommended for installation.

How is this relevant in the context of Buildroot ?

> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_IMMUTABLE_NODES
> +	bool "no edit of nodes, instead copy and replace"
> +	help
> +     Nodes in the information model are not edited but copied and replaced. 
> +     The replacement is done with atomic operations so that the information model is always consistent
> +     and can be accessed from an interrupt or parallel thread (depends on the node storage plugin implementation).
> +     This feature is a prerequisite for UA_MULTITHREADING.
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_COVERAGE
> +	bool "Measure the coverage of unit tests"

Not relevant in the context of Buildroot.

> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_DISCOVERY
> +	bool "Enable Discovery Service (LDS)"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_DISCOVERY_MULTICAST
> +	bool "Discovery Service multicast (LDS-ME)"
> +	help
> +	 Enable Discovery Service with multicast support (LDS-ME)
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_DISCOVERY_SEMAPHORE
> +	bool "Enable Discovery Semaphore support "
> +
> +config BR2_PACKAGE_OPEN62541_SET_UA_NAMESPACE_ZERO
> +	bool "Set UA_NAMESPACE_ZERO ?"
> +
> +if BR2_PACKAGE_OPEN62541_SET_UA_NAMESPACE_ZERO
> +choice 
> +
> +	prompt "Choose UA_NAMESPACE_ZERO ?"
> +
> +	config BR2_PACKAGE_OPEN62541_MINIMAL_UA_NAMESPACE_ZERO
> +		bool "MINIMAL"
> +		help
> +		 A barebones namespace zero that is compatible with most clients. 
> +		 But this namespace 0 is so small that it does not pass the CTT 
> +		 (Conformance Testing Tools of the OPC Foundation).
> +
> +	config BR2_PACKAGE_OPEN62541_REDUCED_UA_NAMESPACE_ZERO
> +		bool "REDUCED"
> +		help
> +		 Small namespace zero that passes the CTT.
> +
> +	config BR2_PACKAGE_OPEN62541_FULL_UA_NAMESPACE_ZERO
> +		bool "FULL"
> +		help
> +		 Full namespace zero generated from the official XML definitions.
> +
> +endchoice
> +endif
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_TYPEDESCRIPTION
> +	bool "Enable TYPEDESCRIPTION"
> +	help
> +	 Add the type and member names to the UA_DataType structure. Enabled by default.
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_STATUSCODE_DESCRIPTIONS
> +	bool "Human readable name of StatusCodes"
> +	help
> +	 Compile the human-readable name of the StatusCodes into the binary. Enabled by default.
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_FULL_NS0
> +	bool "ADVANCED : Use the full NS0 instead of a minimal Namespace 0"
> +	help
> +	 Use the full NS0 instead of a minimal Namespace 0 nodeset UA_FILE_NS0 is used to specify the file for NS0 generation from namespace0 folder. Default value is Opc.Ua.NodeSet2.xml 
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_DEBUG
> +	bool "NOT FOR PROD : Enable assertions and additional definitions"
> +	help
> +	 Enable assertions and additional definitions not intended for production builds
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_DEBUG_DUMP_PKGS
> +	bool "Dump package received as hex"
> +	help
> +	 Dump every package received by the server as hexdump format 
> +
> +menu "open62541 undocumented/advanced build options"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ARCH_ADD_FLAGS
> +	bool "UA_ARCH_ADD_FLAGS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ARCH_EXTRA_INCLUDES
> +	bool "UA_ARCH_EXTRA_INCLUDES"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ARCH_LINKER_FLAGS
> +	bool "UA_ARCH_LINKER_FLAGS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ARCH_REMOVE_FLAGS
> +	bool "UA_ARCH_REMOVE_FLAGS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_FUZZING
> +	bool "UA_BUILD_FUZZING"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_FUZZING_CORPUS
> +	bool "UA_BUILD_FUZZING_CORPUS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_OSS_FUZZ
> +	bool "UA_BUILD_OSS_FUZZ"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_TOOLS
> +	bool "UA_BUILD_TOOLS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_COMPILE_AS_CXX 
> +	bool "UA_COMPILE_AS_CXX"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_DA
> +	bool "UA_ENABLE_DA"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_DETERMINISTIC_RNG
> +	bool "UA_ENABLE_DETERMINISTIC_RNG"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_ENCRYPTION
> +	bool "UA_ENABLE_ENCRYPTION"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_EXPERIMENTAL_HISTORIZING
> +	bool "UA_ENABLE_EXPERIMENTAL_HISTORIZING"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_HARDENING
> +	bool "UA_ENABLE_HARDENING"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_HISTORIZING
> +	bool "UA_ENABLE_HISTORIZING"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_JSON_ENCODING
> +	bool "UA_ENABLE_JSON_ENCODING"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_MALLOC_SINGLETON
> +	bool "UA_ENABLE_MALLOC_SINGLETON"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_MICRO_EMB_DEV_PROFILE
> +	bool "UA_ENABLE_MICRO_EMB_DEV_PROFILE"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_NODESET_COMPILER_DESCRIPTIONS
> +	bool "UA_ENABLE_NODESET_COMPILER_DESCRIPTIONS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_PUBSUB
> +	bool "UA_ENABLE_PUBSUB"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_PUBSUB_CUSTOM_PUBLISH_HANDLING
> +	bool "UA_ENABLE_PUBSUB_CUSTOM_PUBLISH_HANDLING"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_PUBSUB_DELTAFRAMES
> +	bool "UA_ENABLE_PUBSUB_DELTAFRAMES"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_PUBSUB_ETH_UADP
> +	bool "UA_ENABLE_PUBSUB_ETH_UADP"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS
> +	bool "UA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS
> +	bool "UA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_PUBSUB_MQTT
> +	bool "UA_ENABLE_PUBSUB_MQTT"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_QUERY
> +	bool "UA_ENABLE_QUERY"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_STATIC_ANALYZER 
> +	bool "UA_ENABLE_STATIC_ANALYZER"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_UNIT_TESTS_MEMCHECK
> +	bool "UA_ENABLE_UNIT_TESTS_MEMCHECK"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_UNIT_TEST_FAILURE_HOOKS
> +	bool "UA_ENABLE_UNIT_TEST_FAILURE_HOOKS"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_VALGRIND_INTERACTIVE
> +	bool "UA_ENABLE_VALGRIND_INTERACTIVE"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_ENABLE_WEBSOCKET_SERVER
> +	bool "UA_ENABLE_WEBSOCKET_SERVER"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_MSVC_FORCE_STATIC_CRT
> +	bool "UA_MSVC_FORCE_STATIC_CRT"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_PACK_DEBIAN
> +	bool "UA_PACK_DEBIAN"
> +
> +config BR2_PACKAGE_OPEN62541_BOOL_UA_VALGRIND_INTERACTIVE_INTERVAL
> +	bool "UA_VALGRIND_INTERACTIVE_INTERVAL"

There are *way* too many options. Please only add the ones that are
really relevant for you. If needed, other contributors can add more
options later.

> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> new file mode 100644
> index 0000000000..1334f6fce0
> --- /dev/null
> +++ b/package/open62541/open62541.mk
> @@ -0,0 +1,38 @@
> +################################################################################
> +#
> +# open62541
> +#
> +################################################################################
> +
> +OPEN62541_VERSION = v1.0
> +OPEN62541_SITE = $(call github,open62541,open62541,$(OPEN62541_VERSION))
> +
> +OPEN62541_INSTALL_STAGING = YES
> +OPEN62541_INSTALL_TARGET = YES

This last line is not needed, as it's the default. "make check-package"
will warn you about this.

> +
> +OPEN62541_LICENSE = MPL-2.0
> +OPEN62541_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_SET_UA_LOGLEVEL),y)
> +	OPEN62541_CONF_OPTS += -DUA_LOGLEVEL=$(shell echo $(BR2_PACKAGE_OPEN62541_UA_LOGLEVEL) | sed 's/\"//g')

Use $(call qstrip,$(foo)) to remove the double quotes from string
options.

Do not indent the line inside the ifeq().


> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_HAS_UA_MULTITHREADING),y)
> +	OPEN62541_CONF_OPTS += -DUA_MULTITHREADING=$(shell echo $(BR2_PACKAGE_OPEN62541_UA_MULTITHREADING) | sed 's/\"//g')
> +endif

Ditto.

> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_SET_UA_NAMESPACE_ZERO),y)
> +	ifeq ($(BR2_PACKAGE_OPEN62541_MINIMAL_UA_NAMESPACE_ZERO),y)
> +		OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
> +	endif
> +	ifeq ($(BR2_PACKAGE_OPEN62541_REDUCED_UA_NAMESPACE_ZERO),y)
> +		OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
> +	endif
> +	ifeq ($(BR2_PACKAGE_OPEN62541_FULL_UA_NAMESPACE_ZERO),y)
> +		OPEN62541_CONF_OPTS +=  -DUA_NAMESPACE_ZERO=FULL
> +	endif
> +endif

Same for the indentation.

> +OPEN62541_CONF_OPTS += $(foreach v, $(filter BR2_PACKAGE_OPEN62541_BOOL_%,$(.VARIABLES)),  -D$(shell echo $(v) | sed 's/BR2_PACKAGE_OPEN62541_BOOL_//g')=ON )

Sorry, but we don't want this. Just add a limited set of options in
Config.in, and handle them explicitly in the .mk file.

What you do here for example doesn't work for
BR2_PACKAGE_OPEN62541_BOOL_UA_BUILD_SELFSIGNED_CERTIFICATE, which
apparently needs OpenSSL. If OpenSSL is a build-time dependency, then
it needs to be added to OPEN62541_DEPENDENCIES, which you are not doing.

> +$(eval $(cmake-package))
> \ No newline at end of file

Please add a newline at the end of $(eval $(cmake-package)).

Could you address those comments and send a new version of your patch?
When sending a new version, remember to use [PATCH v2] as the prefix
(git format-patch -v2 will do it for you), and to include a changelog
of the changes between v1 and v2 (this changelog should be located
below a --- after your Signed-off-by line in the commit log).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
