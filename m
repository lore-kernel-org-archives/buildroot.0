From: Richard Braun <rbraun@sceen.net>
Date: Wed, 13 Jun 2012 18:08:16 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_xserver=5Fxorg-server=3A_backpo?=
	=?utf-8?q?rt_hotplug_support?=
Message-ID: <1339603696-2787-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hotplug and configuration improvements in the X server 1.8 branch,
namely the udev backend and the xorg.conf.d directory, were backported
in the 1.7 Debian package. Grab the appropriate patches from the Debian
xorg-server_1.7.7-14 sources, bump version to 1.7.7 for the latest fixes
and clean patching, and adjust the makefile to enable the udev backend
when using udev. This, combined with the evdev input driver, provides
automatic support for USB mouse/keyboard hotplugging, and probably other
device types.

Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 ...server_xorg-server-000-config-xorg-conf-d.patch | 1287 +++++++++++++++++++
 ...rver_xorg-server-001-inputclass-sans-abi9.patch | 1334 ++++++++++++++++++++
 ...er_xorg-server-002-config-libudev-backend.patch |  729 +++++++++++
 ...6-dont-complain-about-missing-coredevices.patch |   58 +
 ...xserver_xorg-server-004-unbreak-input-abi.patch |  148 +++
 ...erver-005-xfree86-saner-conf-search-paths.patch |  232 ++++
 ...xserver_xorg-server-006-Add-10-evdev.conf.patch |   97 ++
 .../xserver_xorg-server/xserver_xorg-server.mk     |    8 +-
 8 files changed, 3892 insertions(+), 1 deletions(-)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-000-config-xorg-conf-d.patch
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-001-inputclass-sans-abi9.patch
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-002-config-libudev-backend.patch
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-003-xfree86-dont-complain-about-missing-coredevices.patch
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-004-unbreak-input-abi.patch
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-005-xfree86-saner-conf-search-paths.patch
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-006-Add-10-evdev.conf.patch

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-000-config-xorg-conf-d.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-000-config-xorg-conf-d.patch
new file mode 100644
index 0000000..eddd8b0
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-000-config-xorg-conf-d.patch
@@ -0,0 +1,1287 @@
+From 871bbe1d87fa3c7ebd075e1d1eec33e45b08493d Mon Sep 17 00:00:00 2001
+From: Keith Packard <keithp@keithp.com>
+Date: Wed, 30 Dec 2009 17:16:45 +0000
+Subject: Merge remote branch 'dbn/xorg.conf.d'
+
+---
+Index: xorg-server/configure.ac
+===================================================================
+--- xorg-server.orig/configure.ac
++++ xorg-server/configure.ac
+@@ -1697,6 +1697,7 @@
+ 
+ 	dnl these only go in xorg-config.h
+ 	XF86CONFIGFILE="xorg.conf"
++	XF86CONFIGDIR="xorg.conf.d"
+ 	CONFIGFILE="$sysconfdir/$XF86CONFIGFILE"
+ 	LOGPREFIX="$logdir/Xorg."
+ 	AC_DEFINE(XORG_SERVER, 1, [Building Xorg server])
+@@ -1709,6 +1710,7 @@
+ 	AC_DEFINE(__XSERVERNAME__, "Xorg", [Name of X server])
+ 	AC_DEFINE_DIR(__XCONFIGFILE__, XF86CONFIGFILE, [Name of configuration file])
+ 	AC_DEFINE_DIR(XF86CONFIGFILE, XF86CONFIGFILE, [Name of configuration file])
++	AC_DEFINE_DIR(__XCONFIGDIR__, XF86CONFIGDIR, [Name of configuration directory])
+ 	AC_DEFINE_DIR(DEFAULT_MODULE_PATH, moduledir, [Default module search path])
+ 	AC_DEFINE_DIR(DEFAULT_LIBRARY_PATH, libdir, [Default library install path])
+ 	AC_DEFINE_DIR(DEFAULT_LOGPREFIX, LOGPREFIX, [Default log location])
+Index: xorg-server/cpprules.in
+===================================================================
+--- xorg-server.orig/cpprules.in
++++ xorg-server/cpprules.in
+@@ -36,7 +36,8 @@
+ 	-D__adminmansuffix__=$(ADMIN_MAN_SUFFIX) \
+ 	-D__mandir__=$(mandir) \
+ 	-D__projectroot__=$(prefix) \
+-	-D__xconfigfile__=$(__XCONFIGFILE__) -D__xconfigdir__=$(XCONFIGDIR) \
++	-D__xconfigfile__=$(__XCONFIGFILE__) \
++	-D__xconfigdir__=$(__XCONFIGDIR__) \
+ 	-D__xkbdir__=$(XKB_BASE_DIRECTORY) \
+ 	-D__modulepath__="$(DEFAULT_MODULE_PATH)" \
+ 	-D__xlogfile__=$(XLOGFILE) -D__xservername__=$(XSERVERNAME) 
+Index: xorg-server/hw/xfree86/common/xf86AutoConfig.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86AutoConfig.c
++++ xorg-server/hw/xfree86/common/xf86AutoConfig.c
+@@ -272,7 +272,8 @@
+     for (cp = builtinConfig; *cp; cp++)
+ 	xf86ErrorFVerb(3, "\t%s", *cp);
+     xf86MsgVerb(X_DEFAULT, 3, "--- End of built-in configuration ---\n");
+-    
++
++    xf86initConfigFiles();
+     xf86setBuiltinConfig(builtinConfig);
+     ret = xf86HandleConfigFile(TRUE);
+     FreeConfig();
+Index: xorg-server/hw/xfree86/common/xf86Config.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Config.c
++++ xorg-server/hw/xfree86/common/xf86Config.c
+@@ -95,6 +95,23 @@
+ 			"%P/lib/X11/%X.%H," "%P/lib/X11/%X-%M," \
+ 			"%P/lib/X11/%X"
+ #endif
++#ifndef ROOT_CONFIGDIRPATH
++#define ROOT_CONFIGDIRPATH	"%A," "%R," \
++				"/etc/X11/%R," "%P/etc/X11/%R," \
++				"/etc/X11/%X-%M," "/etc/X11/%X," "/etc/%X," \
++				"%P/etc/X11/%X.%H," "%P/etc/X11/%X-%M," \
++				"%P/etc/X11/%X," \
++				"%P/lib/X11/%X.%H," "%P/lib/X11/%X-%M," \
++				"%P/lib/X11/%X"
++#endif
++#ifndef USER_CONFIGDIRPATH
++#define USER_CONFIGDIRPATH	"/etc/X11/%S," "%P/etc/X11/%S," \
++				"/etc/X11/%X-%M," "/etc/X11/%X," "/etc/%X," \
++				"%P/etc/X11/%X.%H," "%P/etc/X11/%X-%M," \
++				"%P/etc/X11/%X," \
++				"%P/lib/X11/%X.%H," "%P/lib/X11/%X-%M," \
++				"%P/lib/X11/%X"
++#endif
+ #ifndef PROJECTROOT
+ #define PROJECTROOT	"/usr/X11R6"
+ #endif
+@@ -1471,6 +1488,45 @@
+        {0}, FALSE },
+ };
+ 
++static Bool
++configInputDevices(XF86ConfLayoutPtr layout, serverLayoutPtr servlayoutp)
++{
++    XF86ConfInputrefPtr irp;
++    IDevPtr *indp;
++    int count = 0;
++
++    /*
++     * Count the number of input devices.
++     */
++    irp = layout->lay_input_lst;
++    while (irp) {
++	count++;
++	irp = (XF86ConfInputrefPtr)irp->list.next;
++    }
++    DebugF("Found %d input devices in the layout section %s\n",
++	    count, layout.lay_identifier);
++    indp = xnfcalloc((count + 1), sizeof(IDevPtr));
++    indp[count] = NULL;
++    irp = layout->lay_input_lst;
++    count = 0;
++    while (irp) {
++	indp[count] = xnfalloc(sizeof(IDevRec));
++	if (!configInput(indp[count], irp->iref_inputdev, X_CONFIG)) {
++	    while(count--)
++		xfree(indp[count]);
++	    xfree(indp);
++	    return FALSE;
++	}
++	indp[count]->extraOptions = irp->iref_option_lst;
++	count++;
++	irp = (XF86ConfInputrefPtr)irp->list.next;
++    }
++    servlayoutp->inputs = indp;
++
++    return TRUE;
++}
++
++
+ /*
+  * figure out which layout is active, which screens are used in that layout,
+  * which drivers and monitors are used in these screens
+@@ -1481,14 +1537,12 @@
+ {
+     XF86ConfAdjacencyPtr adjp;
+     XF86ConfInactivePtr idp;
+-    XF86ConfInputrefPtr irp;
+     int count = 0;
+     int scrnum;
+     XF86ConfLayoutPtr l;
+     MessageType from;
+     screenLayoutPtr slp;
+     GDevPtr gdp;
+-    IDevPtr* indp;
+     int i = 0, j;
+ 
+     if (!servlayoutp)
+@@ -1701,37 +1755,13 @@
+         count++;
+         idp = (XF86ConfInactivePtr)idp->list.next;
+     }
+-    /*
+-     * Count the number of input devices.
+-     */
+-    count = 0;
+-    irp = conf_layout->lay_input_lst;
+-    while (irp) {
+-        count++;
+-        irp = (XF86ConfInputrefPtr)irp->list.next;
+-    }
+-    DebugF("Found %d input devices in the layout section %s\n",
+-           count, conf_layout->lay_identifier);
+-    indp = xnfcalloc((count + 1), sizeof(IDevPtr));
+-    indp[count] = NULL;
+-    irp = conf_layout->lay_input_lst;
+-    count = 0;
+-    while (irp) {
+-        indp[count] = xnfalloc(sizeof(IDevRec));
+-	if (!configInput(indp[count], irp->iref_inputdev, X_CONFIG)) {
+-            while(count--) 
+-                xfree(indp[count]);
+-            xfree(indp);
+-            return FALSE;
+-	}
+-	indp[count]->extraOptions = irp->iref_option_lst;
+-        count++;
+-        irp = (XF86ConfInputrefPtr)irp->list.next;
+-    }
++
++    if (!configInputDevices(conf_layout, servlayoutp))
++	return FALSE;
++
+     servlayoutp->id = conf_layout->lay_identifier;
+     servlayoutp->screens = slp;
+     servlayoutp->inactives = gdp;
+-    servlayoutp->inputs = indp;
+     servlayoutp->options = conf_layout->lay_option_lst;
+     from = X_DEFAULT;
+ 
+@@ -1743,12 +1773,14 @@
+  * the only active screen.
+  */
+ static Bool
+-configImpliedLayout(serverLayoutPtr servlayoutp, XF86ConfScreenPtr conf_screen)
++configImpliedLayout(serverLayoutPtr servlayoutp, XF86ConfScreenPtr conf_screen,
++                    XF86ConfigPtr xf86configptr)
+ {
+     MessageType from;
+     XF86ConfScreenPtr s;
+     screenLayoutPtr slp;
+     IDevPtr *indp;
++    XF86ConfLayoutRec layout;
+ 
+     if (!servlayoutp)
+ 	return FALSE;
+@@ -1784,10 +1816,19 @@
+     servlayoutp->screens = slp;
+     servlayoutp->inactives = xnfcalloc(1, sizeof(GDevRec));
+     servlayoutp->options = NULL;
+-    /* Set up an empty input device list, then look for some core devices. */
+-    indp = xnfalloc(sizeof(IDevPtr));
+-    *indp = NULL;
+-    servlayoutp->inputs = indp;
++
++    memset(&layout, 0, sizeof(layout));
++    layout.lay_identifier = servlayoutp->id;
++    if (xf86layoutAddInputDevices(xf86configptr, &layout) > 0) {
++	if (!configInputDevices(&layout, servlayoutp))
++	    return FALSE;
++	from = X_DEFAULT;
++    } else {
++	/* Set up an empty input device list, then look for some core devices. */
++	indp = xnfalloc(sizeof(IDevPtr));
++	*indp = NULL;
++	servlayoutp->inputs = indp;
++    }
+ 
+     return TRUE;
+ }
+@@ -2428,34 +2469,53 @@
+ ConfigStatus
+ xf86HandleConfigFile(Bool autoconfig)
+ {
+-    const char *filename;
+-    char *searchpath;
+-    MessageType from = X_DEFAULT;
++    const char *filename, *dirname;
++    char *filesearch, *dirsearch;
++    MessageType filefrom = X_DEFAULT;
++    MessageType dirfrom = X_DEFAULT;
+     char *scanptr;
+     Bool singlecard = 0;
+     Bool implicit_layout = FALSE;
+ 
+     if (!autoconfig) {
+-	if (getuid() == 0)
+-	    searchpath = ROOT_CONFIGPATH;
+-	else
+-	    searchpath = USER_CONFIGPATH;
++	if (getuid() == 0) {
++	    filesearch = ROOT_CONFIGPATH;
++	    dirsearch = ROOT_CONFIGDIRPATH;
++	} else {
++	    filesearch = USER_CONFIGPATH;
++	    dirsearch = USER_CONFIGDIRPATH;
++	}
+ 
+ 	if (xf86ConfigFile)
+-	    from = X_CMDLINE;
+-
+-	filename = xf86openConfigFile(searchpath, xf86ConfigFile, PROJECTROOT);
++	    filefrom = X_CMDLINE;
++	if (xf86ConfigDir)
++	    dirfrom = X_CMDLINE;
++
++	xf86initConfigFiles();
++	filename = xf86openConfigFile(filesearch, xf86ConfigFile, PROJECTROOT);
++	dirname = xf86openConfigDirFiles(dirsearch, xf86ConfigDir, PROJECTROOT);
+ 	if (filename) {
+-	    xf86MsgVerb(from, 0, "Using config file: \"%s\"\n", filename);
++	    xf86MsgVerb(filefrom, 0, "Using config file: \"%s\"\n", filename);
+ 	    xf86ConfigFile = xnfstrdup(filename);
+ 	} else {
+ 	    if (xf86ConfigFile)
+ 		xf86Msg(X_ERROR, "Unable to locate/open config file: \"%s\"\n",
+ 			xf86ConfigFile);
+-	    return CONFIG_NOFILE;
+ 	}
++	if (dirname) {
++	    xf86MsgVerb(dirfrom, 0, "Using config directory: \"%s\"\n",
++			dirname);
++	    xf86ConfigDir = xnfstrdup(dirname);
++	} else {
++	    if (xf86ConfigDir)
++		xf86Msg(X_ERROR,
++			"Unable to locate/open config directory: \"%s\"\n",
++			xf86ConfigDir);
++	}
++	if (!filename && !dirname)
++	    return CONFIG_NOFILE;
+     }
+-     
++
+     if ((xf86configptr = xf86readConfigFile ()) == NULL) {
+ 	xf86Msg(X_ERROR, "Problem parsing the config file\n");
+ 	return CONFIG_PARSE_ERROR;
+@@ -2481,7 +2541,8 @@
+ 		    "No Layout section.  Using the first Screen section.\n");
+ 	}
+ 	if (!configImpliedLayout(&xf86ConfigLayout,
+-				 xf86configptr->conf_screen_lst)) {
++				 xf86configptr->conf_screen_lst,
++				 xf86configptr)) {
+             xf86Msg(X_ERROR, "Unable to determine the screen layout\n");
+ 	    return CONFIG_PARSE_ERROR;
+ 	}
+Index: xorg-server/hw/xfree86/common/xf86Globals.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Globals.c
++++ xorg-server/hw/xfree86/common/xf86Globals.c
+@@ -143,6 +143,7 @@
+ #endif
+ };
+ const char *xf86ConfigFile = NULL;
++const char *xf86ConfigDir = NULL;
+ const char *xf86ModulePath = DEFAULT_MODULE_PATH;
+ MessageType xf86ModPathFrom = X_DEFAULT;
+ const char *xf86LogFile = DEFAULT_LOGPREFIX;
+Index: xorg-server/hw/xfree86/common/xf86Init.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Init.c
++++ xorg-server/hw/xfree86/common/xf86Init.c
+@@ -1375,6 +1375,19 @@
+     xf86ConfigFile = argv[i + 1];
+     return 2;
+   }
++  if (!strcmp(argv[i], "-configdir"))
++  {
++    CHECK_FOR_REQUIRED_ARGUMENT();
++    if (getuid() != 0 && !xf86PathIsSafe(argv[i + 1])) {
++      FatalError("\nInvalid argument for %s\n"
++	  "\tFor non-root users, the file specified with %s must be\n"
++	  "\ta relative path and must not contain any \"..\" elements.\n"
++	  "\tUsing default "__XCONFIGDIR__" search path.\n\n",
++	  argv[i], argv[i]);
++    }
++    xf86ConfigDir = argv[i + 1];
++    return 2;
++  }
+   if (!strcmp(argv[i],"-flipPixels"))
+   {
+     xf86FlipPixels = TRUE;
+@@ -1658,6 +1671,8 @@
+   }
+   ErrorF("-config file           specify a configuration file, relative to the\n");
+   ErrorF("                       "__XCONFIGFILE__" search path, only root can use absolute\n");
++  ErrorF("-configdir dir         specify a configuration directory, relative to the\n");
++  ErrorF("                       "__XCONFIGDIR__" search path, only root can use absolute\n");
+   ErrorF("-verbose [n]           verbose startup messages\n");
+   ErrorF("-logverbose [n]        verbose log messages\n");
+   ErrorF("-quiet                 minimal startup messages\n");
+Index: xorg-server/hw/xfree86/common/xf86Priv.h
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Priv.h
++++ xorg-server/hw/xfree86/common/xf86Priv.h
+@@ -46,6 +46,7 @@
+  * The global state of these things is held in xf86InfoRec (when appropriate).
+  */
+ extern _X_EXPORT const char *xf86ConfigFile;
++extern _X_EXPORT const char *xf86ConfigDir;
+ extern _X_EXPORT  Bool xf86AllowMouseOpenFail;
+ #ifdef XF86VIDMODE
+ extern _X_EXPORT  Bool xf86VidModeDisabled;
+Index: xorg-server/hw/xfree86/doc/man/Xorg.man.pre
+===================================================================
+--- xorg-server.orig/hw/xfree86/doc/man/Xorg.man.pre
++++ xorg-server/hw/xfree86/doc/man/Xorg.man.pre
+@@ -109,7 +109,7 @@
+ .B __xservername__
+ supports several mechanisms for supplying/obtaining configuration and
+ run-time parameters: command line options, environment variables, the
+-__xconfigfile__(__filemansuffix__) configuration file, auto-detection, and
++__xconfigfile__(__filemansuffix__) configuration files, auto-detection, and
+ fallback defaults.  When the same information is supplied in more than
+ one way, the highest precedence mechanism is used.  The list of mechanisms
+ is ordered from highest precedence to lowest.  Note that not all parameters
+@@ -176,6 +176,13 @@
+ with real-uid 0), or for files relative to a directory in the config
+ search path for all other users.
+ .TP 8
++.BI \-configdir " directory"
++Read the server configuration files from
++.IR directory .
++This option will work for any directory when the server is run as root
++(i.e, with real-uid 0), or for directories relative to a directory in the
++config directory search path for all other users.
++.TP 8
+ .B \-configure
+ When this option is specified, the
+ .B __xservername__
+@@ -456,6 +463,10 @@
+ .B __xservername__
+ typically uses a configuration file called
+ .B __xconfigfile__
++and configuration files with the suffix
++.I .conf
++in a directory called
++.B __xconfigdir__
+ for its initial setup.
+ Refer to the __xconfigfile__(__filemansuffix__) manual page for information
+ about the format of this file.
+@@ -464,7 +475,9 @@
+ has a mechanism for automatically generating a built-in configuration
+ at run-time when no
+ .B __xconfigfile__
+-file is present.  The current version of this automatic configuration
++file or
++.B __xconfigdir__
++files are present.  The current version of this automatic configuration
+ mechanism works in two ways.
+ .PP
+ The first is via enhancements that have made many components of the
+@@ -486,7 +499,7 @@
+ .SH FILES
+ The
+ .B __xservername__
+-server config file can be found in a range of locations.  These are
++server config files can be found in a range of locations.  These are
+ documented fully in the __xconfigfile__(__filemansuffix__) manual page.  The
+ most commonly used locations are shown here.
+ .TP 30
+@@ -505,6 +518,21 @@
+ .B __projectroot__/lib/X11/__xconfigfile__
+ Server configuration file.
+ .TP 30
++.B /etc/X11/__xconfigdir__
++Server configuration directory.
++.TP 30
++.B /etc/X11/__xconfigdir__-4
++Server configuration directory.
++.TP 30
++.B /etc/__xconfigdir__
++Server configuration directory.
++.TP 30
++.B __projectroot__/etc/__xconfigdir__
++Server configuration directory.
++.TP 30
++.B __projectroot__/lib/X11/__xconfigdir__
++Server configuration directory.
++.TP 30
+ .BI __logdir__/__xservername__. n .log
+ Server log file for display
+ .IR n .
+Index: xorg-server/hw/xfree86/doc/man/xorg.conf.man.pre
+===================================================================
+--- xorg-server.orig/hw/xfree86/doc/man/xorg.conf.man.pre
++++ xorg-server/hw/xfree86/doc/man/xorg.conf.man.pre
+@@ -2,27 +2,35 @@
+ .ds q \N'34'
+ .TH __xconfigfile__ __filemansuffix__ __vendorversion__
+ .SH NAME
+-__xconfigfile__ \- configuration File for __xservername__ X server
++__xconfigfile__ and __xconfigdir__ \- configuration files for
++__xservername__ X server
+ .SH INTRODUCTION
+ .B __xservername__
+ supports several mechanisms for supplying/obtaining configuration and
+ run-time parameters: command line options, environment variables, the
+-__xconfigfile__ configuration file, auto-detection, and fallback defaults.
+-When the same information is supplied in more than one way, the highest
+-precedence mechanism is used.  The list of mechanisms is ordered from
+-highest precedence to lowest.  Note that not all parameters can be
+-supplied via all methods.  The available command line options and
+-environment variables (and some defaults) are described in the Xserver(__appmansuffix__)
+-and __xservername__(__appmansuffix__) manual pages.  Most configuration file parameters, with
+-their defaults, are described below.  Driver and module specific
+-configuration parameters are described in the relevant driver or module
+-manual page.
++__xconfigfile__ and __xconfigdir__ configuration files, auto-detection,
++and fallback defaults. When the same information is supplied in more
++than one way, the highest precedence mechanism is used. The list of
++mechanisms is ordered from highest precedence to lowest. Note that not
++all parameters can be supplied via all methods. The available command
++line options and environment variables (and some defaults) are
++described in the Xserver(__appmansuffix__) and
++__xservername__(__appmansuffix__) manual pages. Most configuration file
++parameters, with their defaults, are described below. Driver and module
++specific configuration parameters are described in the relevant driver
++or module manual page.
+ .SH DESCRIPTION
+ .B __xservername__
+ uses a configuration file called
+ .I __xconfigfile__
++and files ending in the suffix
++.I .conf
++from the directory
++.I __xconfigdir__
+ for its initial setup.
+-This configuration file is searched for in the following places when the
++The
++.I __xconfigfile__
++configuration file is searched for in the following places when the
+ server is started as a normal user:
+ .PP
+ .RS 4
+@@ -93,9 +101,28 @@
+ is the machine's hostname as reported by
+ .BR gethostname (__libmansuffix__).
+ .PP
++Additional configuration files are searched for in the following
++directories:
++.PP
++.RS 4
++.nf
++.I /etc/X11/__xconfigdir__\-4
++.I /etc/X11/__xconfigdir__
++.I /etc/__xconfigdir__
++.IR __projectroot__/etc/X11/__xconfigdir__. <hostname>
++.I __projectroot__/etc/X11/__xconfigdir__\-4
++.I __projectroot__/etc/X11/__xconfigdir__
++.IR __projectroot__/lib/X11/__xconfigdir__. <hostname>
++.I __projectroot__/lib/X11/__xconfigdir__\-4
++.I __projectroot__/lib/X11/__xconfigdir__
++.fi
++.RE
++.PP
+ The
+ .I __xconfigfile__
+-file is composed of a number of sections which may be present in any order,
++and
++.I __xconfigdir__
++files are composed of a number of sections which may be present in any order,
+ or omitted to use default configuration values.
+ Each section has the form:
+ .PP
+@@ -853,6 +880,11 @@
+ See the individual input driver manual pages for a description of the
+ device\-specific options.
+ .TP 7
++.BI "Option \*qAutoServerLayout\*q  \*q" boolean \*q
++Always add the device to the ServerLayout section used by this instance of
++the server. This affects implied layouts as well as explicit layouts
++specified in the configuration and/or on the command line.
++.TP 7
+ .BI "Option \*qCorePointer\*q"
+ Deprecated, use
+ .B SendCoreEvents
+Index: xorg-server/hw/xfree86/parser/Layout.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/Layout.c
++++ xorg-server/hw/xfree86/parser/Layout.c
+@@ -64,6 +64,10 @@
+ #include "Configint.h"
+ #include <string.h>
+ 
++
++/* Needed for auto server layout */
++extern int xf86CheckBoolOption(void* optlist, const char *name, int deflt);
++
+ extern LexRec val;
+ 
+ static xf86ConfigSymTabRec LayoutTab[] =
+@@ -450,15 +454,67 @@
+ }
+ 
+ int
++xf86layoutAddInputDevices(XF86ConfigPtr config, XF86ConfLayoutPtr layout)
++{
++    int count = 0;
++    XF86ConfInputPtr input = config->conf_input_lst;
++    XF86ConfInputrefPtr inptr;
++
++    /* add all AutoServerLayout devices to the server layout */
++    while (input)
++    {
++	if (xf86CheckBoolOption(input->inp_option_lst, "AutoServerLayout", FALSE))
++	{
++	    XF86ConfInputrefPtr iref = layout->lay_input_lst;
++
++	    /* avoid duplicates if referenced but lists AutoServerLayout too */
++	    while (iref)
++	    {
++		if (strcmp(iref->iref_inputdev_str, input->inp_identifier) == 0)
++		    break;
++		iref = iref->list.next;
++	    }
++
++	    if (!iref)
++	    {
++		XF86ConfInputrefPtr iptr;
++		iptr = calloc(1, sizeof(XF86ConfInputrefRec));
++		iptr->iref_inputdev_str = input->inp_identifier;
++		layout->lay_input_lst = (XF86ConfInputrefPtr)
++		    xf86addListItem((glp)layout->lay_input_lst, (glp)iptr);
++		count++;
++	    }
++	}
++	input = input->list.next;
++    }
++
++    inptr = layout->lay_input_lst;
++    while (inptr)
++    {
++	input = xf86findInput (inptr->iref_inputdev_str,
++		config->conf_input_lst);
++	if (!input)
++	{
++	    xf86validationError (UNDEFINED_INPUT_MSG,
++		    inptr->iref_inputdev_str, layout->lay_identifier);
++	    return -1;
++	}
++	else
++	    inptr->iref_inputdev = input;
++	inptr = inptr->list.next;
++    }
++
++    return count;
++}
++
++int
+ xf86validateLayout (XF86ConfigPtr p)
+ {
+ 	XF86ConfLayoutPtr layout = p->conf_layout_lst;
+ 	XF86ConfAdjacencyPtr adj;
+ 	XF86ConfInactivePtr iptr;
+-	XF86ConfInputrefPtr inptr;
+ 	XF86ConfScreenPtr screen;
+ 	XF86ConfDevicePtr device;
+-	XF86ConfInputPtr input;
+ 
+ 	while (layout)
+ 	{
+@@ -500,21 +556,10 @@
+ 				iptr->inactive_device = device;
+ 			iptr = iptr->list.next;
+ 		}
+-		inptr = layout->lay_input_lst;
+-		while (inptr)
+-		{
+-			input = xf86findInput (inptr->iref_inputdev_str,
+-									p->conf_input_lst);
+-			if (!input)
+-			{
+-				xf86validationError (UNDEFINED_INPUT_MSG,
+-						inptr->iref_inputdev_str, layout->lay_identifier);
+-				return (FALSE);
+-			}
+-			else
+-				inptr->iref_inputdev = input;
+-			inptr = inptr->list.next;
+-		}
++
++		if (xf86layoutAddInputDevices(p, layout) == -1)
++		    return FALSE;
++
+ 		layout = layout->list.next;
+ 	}
+ 	return (TRUE);
+Index: xorg-server/hw/xfree86/parser/scan.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/scan.c
++++ xorg-server/hw/xfree86/parser/scan.c
+@@ -62,8 +62,11 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
++#include <dirent.h>
+ #include <unistd.h>
+ #include <stdarg.h>
++#include <X11/Xdefs.h>
+ #include <X11/Xfuncproto.h>
+ 
+ #if defined(_POSIX_SOURCE)
+@@ -90,17 +93,24 @@
+ #include "xf86tokens.h"
+ 
+ #define CONFIG_BUF_LEN     1024
++#define CONFIG_MAX_FILES   64
+ 
+ static int StringToToken (char *, xf86ConfigSymTabRec *);
+ 
+-static FILE *configFile = NULL;
++static struct {
++	FILE *file;
++	char *path;
++} configFiles[CONFIG_MAX_FILES];
+ static const char **builtinConfig = NULL;
+ static int builtinIndex = 0;
+ static int configPos = 0;		/* current readers position */
+ static int configLineNo = 0;	/* linenumber */
+ static char *configBuf, *configRBuf;	/* buffer for lines */
+ static char *configPath;		/* path to config file */
++static char *configDirPath;		/* path to config dir */
+ static char *configSection = NULL;	/* name of current section being parsed */
++static int numFiles = 0;		/* number of config files */
++static int curFileIndex = 0;		/* index of current config file */
+ static int pushToken = LOCK_TOKEN;
+ static int eol_seen = 0;		/* private state to handle comments */
+ LexRec val;
+@@ -155,7 +165,7 @@
+ /*
+  * xf86getNextLine --
+  *
+- *  read from the configFile FILE stream until we encounter a new
++ *  read from the configFiles FILE stream until we encounter a new
+  *  line; this is effectively just a big wrapper for fgets(3).
+  *
+  *  xf86getToken() assumes that we will read up to the next
+@@ -213,9 +223,18 @@
+ 	/* read in another block of chars */
+ 
+ 	do {
+-		ret = fgets(configBuf + pos, configBufLen - pos - 1, configFile);
++		ret = fgets(configBuf + pos, configBufLen - pos - 1,
++			    configFiles[curFileIndex].file);
+ 
+-		if (!ret) break;
++		if (!ret) {
++			/* stop if there are no more files */
++			if (++curFileIndex >= numFiles) {
++				curFileIndex = 0;
++				break;
++			}
++			configLineNo = 0;
++			continue;
++		}
+ 
+ 		/* search for EOL in the new block of chars */
+ 
+@@ -306,7 +325,7 @@
+ 		if (!c)
+ 		{
+ 			char *ret;
+-			if (configFile)
++			if (numFiles > 0)
+ 				ret = xf86getNextLine();
+ 			else {
+ 				if (builtinConfig[builtinIndex] == NULL)
+@@ -575,6 +594,12 @@
+ #ifndef XCONFIGFILE
+ #define XCONFIGFILE	"xorg.conf"
+ #endif
++#ifndef XCONFIGDIR
++#define XCONFIGDIR	"xorg.conf.d"
++#endif
++#ifndef XCONFIGSUFFIX
++#define XCONFIGSUFFIX	".conf"
++#endif
+ #ifndef PROJECTROOT
+ #define PROJECTROOT	"/usr/X11R6"
+ #endif
+@@ -616,7 +641,8 @@
+ 
+ static char *
+ DoSubstitution(const char *template, const char *cmdline, const char *projroot,
+-				int *cmdlineUsed, int *envUsed, char *XConfigFile)
++				int *cmdlineUsed, int *envUsed,
++				const char *XConfigFile)
+ {
+ 	char *result;
+ 	int i, l;
+@@ -745,7 +771,164 @@
+ 	return result;
+ }
+ 
+-/* 
++/*
++ * Given some searching parameters, locate and open the xorg config file.
++ */
++static char *
++OpenConfigFile(const char *path, const char *cmdline, const char *projroot,
++	       const char *confname)
++{
++	char *filepath = NULL;
++	char *pathcopy;
++	const char *template;
++	int cmdlineUsed = 0;
++	FILE *file = NULL;
++
++	pathcopy = strdup(path);
++	for (template = strtok(pathcopy, ","); template && !file;
++	     template = strtok(NULL, ",")) {
++		filepath = DoSubstitution(template, cmdline, projroot,
++					  &cmdlineUsed, NULL, confname);
++		if (!filepath)
++			continue;
++		if (cmdline && !cmdlineUsed) {
++			free(filepath);
++			filepath = NULL;
++			continue;
++		}
++		file = fopen(filepath, "r");
++		if (!file) {
++			free(filepath);
++			filepath = NULL;
++		}
++	}
++
++	if (file) {
++		configFiles[numFiles].file = file;
++		configFiles[numFiles].path = strdup(filepath);
++		numFiles++;
++	}
++	return filepath;
++}
++
++/*
++ * Match non-hidden files in the xorg config directory with a .conf
++ * suffix. This filter is passed to scandir(3).
++ */
++static int
++ConfigFilter(const struct dirent *de)
++{
++	const char *name = de->d_name;
++	size_t len = strlen(name);
++	size_t suflen = strlen(XCONFIGSUFFIX);
++
++	if (!name || name[0] == '.' || len <= suflen)
++		return 0;
++	if (strcmp(&name[len-suflen], XCONFIGSUFFIX) != 0)
++		return 0;
++	return 1;
++}
++
++static Bool
++AddConfigDirFiles(const char *dirpath, struct dirent **list, int num)
++{
++	int i;
++	Bool openedFile = FALSE;
++	Bool warnOnce = FALSE;
++
++	for (i = 0; i < num; i++) {
++		char *path;
++		FILE *file;
++
++		if (numFiles >= CONFIG_MAX_FILES) {
++			if (!warnOnce) {
++				ErrorF("Maximum number of configuration "
++				       "files opened\n");
++				warnOnce = TRUE;
++			}
++			free(list[i]);
++			continue;
++		}
++
++		path = malloc(PATH_MAX + 1);
++		snprintf(path, PATH_MAX + 1, "%s/%s", dirpath,
++			 list[i]->d_name);
++		free(list[i]);
++		file = fopen(path, "r");
++		if (!file) {
++			free(path);
++			continue;
++		}
++		openedFile = TRUE;
++
++		configFiles[numFiles].file = file;
++		configFiles[numFiles].path = path;
++		numFiles++;
++	}
++
++	return openedFile;
++}
++
++/*
++ * Given some searching parameters, locate and open the xorg config
++ * directory. The directory does not need to contain config files.
++ */
++static char *
++OpenConfigDir(const char *path, const char *cmdline, const char *projroot,
++	      const char *confname)
++{
++	char *dirpath, *pathcopy;
++	const char *template;
++	Bool found = FALSE;
++	int cmdlineUsed = 0;
++
++	pathcopy = strdup(path);
++	for (template = strtok(pathcopy, ","); template && !found;
++	     template = strtok(NULL, ",")) {
++		struct dirent **list = NULL;
++		int num;
++
++		dirpath = DoSubstitution(template, cmdline, projroot,
++					 &cmdlineUsed, NULL, confname);
++		if (!dirpath)
++			continue;
++		if (cmdline && !cmdlineUsed) {
++			free(dirpath);
++			dirpath = NULL;
++			continue;
++		}
++
++		/* match files named *.conf */
++		num = scandir(dirpath, &list, ConfigFilter, alphasort);
++		found = AddConfigDirFiles(dirpath, list, num);
++		if (!found) {
++			free(dirpath);
++			dirpath = NULL;
++			if (list)
++				free(list);
++		}
++	}
++
++	return dirpath;
++}
++
++/*
++ * xf86initConfigFiles -- Setup global variables and buffers.
++ */
++void
++xf86initConfigFiles(void)
++{
++	curFileIndex = 0;
++	configPos = 0;
++	configLineNo = 0;
++	pushToken = LOCK_TOKEN;
++
++	configBuf = malloc(CONFIG_BUF_LEN);
++	configRBuf = malloc(CONFIG_BUF_LEN);
++	configBuf[0] = '\0';	/* sanity ... */
++}
++
++/*
+  * xf86openConfigFile --
+  *
+  * This function take a config file search path (optional), a command-line
+@@ -758,7 +941,7 @@
+  * opened.  When no file is found, the return value is NULL.
+  *
+  * The escape sequences allowed in the search path are defined above.
+- *  
++ *
+  */
+ 
+ #ifndef DEFAULT_CONF_PATH
+@@ -780,117 +963,90 @@
+ const char *
+ xf86openConfigFile(const char *path, const char *cmdline, const char *projroot)
+ {
+-	char *pathcopy;
+-	const char *template;
+-	int cmdlineUsed = 0;
+-
+-	configFile = NULL;
+-	configPos = 0;		/* current readers position */
+-	configLineNo = 0;	/* linenumber */
+-	pushToken = LOCK_TOKEN;
+-
+ 	if (!path || !path[0])
+ 		path = DEFAULT_CONF_PATH;
+-	pathcopy = malloc(strlen(path) + 1);
+-	strcpy(pathcopy, path);
+ 	if (!projroot || !projroot[0])
+ 		projroot = PROJECTROOT;
+ 
+-	template = strtok(pathcopy, ",");
+-
+-	/* First, search for a config file. */
+-	while (template && !configFile) {
+-		if ((configPath = DoSubstitution(template, cmdline, projroot,
+-						 &cmdlineUsed, NULL,
+-						 XCONFIGFILE))) {
+-			if ((configFile = fopen(configPath, "r")) != 0) {
+-				if (cmdline && !cmdlineUsed) {
+-					fclose(configFile);
+-					configFile = NULL;
+-				}
+-			}
+-		}
+-		if (configPath && !configFile) {
+-			free(configPath);
+-			configPath = NULL;
+-		}
+-		template = strtok(NULL, ",");
+-	}
+-	
+-	/* Then search for fallback */
+-	if (!configFile) {
+-	    strcpy(pathcopy, path);
+-	    template = strtok(pathcopy, ",");
+-
+-	    while (template && !configFile) {
+-		if ((configPath = DoSubstitution(template, cmdline, projroot,
+-						 &cmdlineUsed, NULL,
+-						 XFREE86CFGFILE))) {
+-		    if ((configFile = fopen(configPath, "r")) != 0) {
+-			if (cmdline && !cmdlineUsed) {
+-			    fclose(configFile);
+-			    configFile = NULL;
+-			}
+-		    }
+-		}
+-		if (configPath && !configFile) {
+-		    free(configPath);
+-		    configPath = NULL;
+-		}
+-		template = strtok(NULL, ",");
+-	    }
+-	}
+-	
+-	free(pathcopy);
+-	if (!configFile) {
+-
+-		return NULL;
+-	}
++	/* Search for a config file or a fallback */
++	configPath = OpenConfigFile(path, cmdline, projroot, XCONFIGFILE);
++	if (!configPath)
++		configPath = OpenConfigFile(path, cmdline, projroot,
++					    XFREE86CFGFILE);
++	return configPath;
++}
+ 
+-	configBuf = malloc (CONFIG_BUF_LEN);
+-	configRBuf = malloc (CONFIG_BUF_LEN);
+-	configBuf[0] = '\0';		/* sanity ... */
++/*
++ * xf86openConfigDirFiles --
++ *
++ * This function take a config directory search path (optional), a
++ * command-line specified directory name (optional) and the ProjectRoot path
++ * (optional) and locates and opens a config directory based on that
++ * information.  If a command-line name is specified, then this function
++ * fails if it is not found.
++ *
++ * The return value is a pointer to the actual name of the direcoty that was
++ * opened.  When no directory is found, the return value is NULL.
++ *
++ * The escape sequences allowed in the search path are defined above.
++ *
++ */
++const char *
++xf86openConfigDirFiles(const char *path, const char *cmdline,
++		       const char *projroot)
++{
++	if (!path || !path[0])
++		path = DEFAULT_CONF_PATH;
++	if (!projroot || !projroot[0])
++		projroot = PROJECTROOT;
+ 
+-	return configPath;
++	/* Search for the multiconf directory */
++	configDirPath = OpenConfigDir(path, cmdline, projroot, XCONFIGDIR);
++	return configDirPath;
+ }
+ 
+ void
+ xf86closeConfigFile (void)
+ {
++	int i;
++
+ 	free (configPath);
+ 	configPath = NULL;
++	free (configDirPath);
++	configDirPath = NULL;
+ 	free (configRBuf);
+ 	configRBuf = NULL;
+ 	free (configBuf);
+ 	configBuf = NULL;
+ 
+-	if (configFile) {
+-		fclose (configFile);
+-		configFile = NULL;
+-	} else {
++	if (numFiles == 0) {
+ 		builtinConfig = NULL;
+ 		builtinIndex = 0;
+ 	}
++	for (i = 0; i < numFiles; i++) {
++		fclose(configFiles[i].file);
++		configFiles[i].file = NULL;
++		free(configFiles[i].path);
++		configFiles[i].path = NULL;
++	}
++	numFiles = 0;
+ }
+ 
+ void
+ xf86setBuiltinConfig(const char *config[])
+ {
+ 	builtinConfig = config;
+-	configPath = strdup("<builtin configuration>");
+-	configBuf = malloc (CONFIG_BUF_LEN);
+-	configRBuf = malloc (CONFIG_BUF_LEN);
+-	configBuf[0] = '\0';		/* sanity ... */
+-
+ }
+ 
+ void
+ xf86parseError (char *format,...)
+ {
+ 	va_list ap;
++	char *filename = numFiles ? configFiles[curFileIndex].path :
++			 "<builtin configuration>";
+ 
+ 	ErrorF ("Parse error on line %d of section %s in file %s\n\t",
+-		 configLineNo, configSection, configPath);
++		 configLineNo, configSection, filename);
+ 	va_start (ap, format);
+ 	VErrorF (format, ap);
+ 	va_end (ap);
+@@ -902,8 +1058,10 @@
+ xf86validationError (char *format,...)
+ {
+ 	va_list ap;
++	char *filename = numFiles ? configFiles[curFileIndex].path :
++			 "<builtin configuration>";
+ 
+-	ErrorF ("Data incomplete in file %s\n\t", configPath);
++	ErrorF ("Data incomplete in file %s\n\t", filename);
+ 	va_start (ap, format);
+ 	VErrorF (format, ap);
+ 	va_end (ap);
+Index: xorg-server/hw/xfree86/parser/xf86Parser.h
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/xf86Parser.h
++++ xorg-server/hw/xfree86/parser/xf86Parser.h
+@@ -456,13 +456,16 @@
+ /*
+  * prototypes for public functions
+  */
+-extern _X_EXPORT const char *xf86openConfigFile (const char *, const char *,
+-					const char *);
+-extern _X_EXPORT void xf86setBuiltinConfig(const char *config[]);
+-extern _X_EXPORT XF86ConfigPtr xf86readConfigFile (void);
+-extern _X_EXPORT void xf86closeConfigFile (void);
+-extern _X_EXPORT void xf86freeConfig (XF86ConfigPtr p);
+-extern _X_EXPORT int xf86writeConfigFile (const char *, XF86ConfigPtr);
++extern void xf86initConfigFiles(void);
++extern const char *xf86openConfigFile(const char *path, const char *cmdline,
++				      const char *projroot);
++extern const char *xf86openConfigDirFiles(const char *path, const char *cmdline,
++					  const char *projroot);
++extern void xf86setBuiltinConfig(const char *config[]);
++extern XF86ConfigPtr xf86readConfigFile(void);
++extern void xf86closeConfigFile(void);
++extern void xf86freeConfig(XF86ConfigPtr p);
++extern int xf86writeConfigFile(const char *, XF86ConfigPtr);
+ extern _X_EXPORT XF86ConfDevicePtr xf86findDevice(const char *ident, XF86ConfDevicePtr p);
+ extern _X_EXPORT XF86ConfLayoutPtr xf86findLayout(const char *name, XF86ConfLayoutPtr list);
+ extern _X_EXPORT XF86ConfMonitorPtr xf86findMonitor(const char *ident, XF86ConfMonitorPtr p);
+@@ -473,6 +476,7 @@
+ extern _X_EXPORT XF86ConfInputPtr xf86findInputByDriver(const char *driver, XF86ConfInputPtr p);
+ extern _X_EXPORT XF86ConfVideoAdaptorPtr xf86findVideoAdaptor(const char *ident,
+ 						XF86ConfVideoAdaptorPtr p);
++extern int xf86layoutAddInputDevices(XF86ConfigPtr config, XF86ConfLayoutPtr layout);
+ 
+ extern _X_EXPORT GenericListPtr xf86addListItem(GenericListPtr head, GenericListPtr c_new);
+ extern _X_EXPORT int xf86itemNotSublist(GenericListPtr list_1, GenericListPtr list_2);
+Index: xorg-server/hw/xwin/InitOutput.c
+===================================================================
+--- xorg-server.orig/hw/xwin/InitOutput.c
++++ xorg-server/hw/xwin/InitOutput.c
+@@ -851,6 +851,9 @@
+   ErrorF ("-config\n"
+           "\tSpecify a configuration file.\n");
+ 
++  ErrorF ("-configdir\n"
++          "\tSpecify a configuration directory.\n");
++
+   ErrorF ("-keyboard\n"
+ 	  "\tSpecify a keyboard device from the configuration file.\n");
+ #endif
+Index: xorg-server/hw/xwin/winconfig.c
+===================================================================
+--- xorg-server.orig/hw/xwin/winconfig.c
++++ xorg-server/hw/xwin/winconfig.c
+@@ -50,6 +50,13 @@
+                     "%P/lib/X11/%X.%H," "%P/lib/X11/%X-%M," \
+                     "%P/lib/X11/%X"
+ #endif
++#ifndef CONFIGDIRPATH
++#define CONFIGDIRPATH  "/etc/X11/%X-%M," "/etc/X11/%X," "/etc/%X," \
++                       "%P/etc/X11/%X.%H," "%P/etc/X11/%X-%M," \
++                       "%P/etc/X11/%X," \
++                       "%P/lib/X11/%X.%H," "%P/lib/X11/%X-%M," \
++                       "%P/lib/X11/%X"
++#endif
+ 
+ XF86ConfigPtr g_xf86configptr = NULL;
+ #endif
+@@ -57,6 +64,7 @@
+ WinCmdlineRec g_cmdline = {
+ #ifdef XWIN_XF86CONFIG
+   NULL,				/* configFile */
++  NULL,				/* configDir */
+ #endif
+   NULL,				/* fontPath */
+ #ifdef XWIN_XF86CONFIG
+@@ -109,20 +117,28 @@
+ winReadConfigfile ()
+ {
+   Bool		retval = TRUE;
+-  const char	*filename;
+-  MessageType	from = X_DEFAULT;
++  const char	*filename, *dirname;
++  MessageType	filefrom = X_DEFAULT;
++  MessageType	dirfrom = X_DEFAULT;
+   char		*xf86ConfigFile = NULL;
++  char		*xf86ConfigDir = NULL;
+ 
+   if (g_cmdline.configFile)
+     {
+-      from = X_CMDLINE;
++      filefrom = X_CMDLINE;
+       xf86ConfigFile = g_cmdline.configFile;
+     }
++  if (g_cmdline.configDir)
++    {
++      dirfrom = X_CMDLINE;
++      xf86ConfigDir = g_cmdline.configDir;
++    }
+ 
+   /* Parse config file into data structure */
+-
++  xf86initConfigFiles();
+   filename = xf86openConfigFile (CONFIGPATH, xf86ConfigFile, PROJECTROOT);
+-    
++  dirname = xf86openConfigDirFiles (CONFIGDIRPATH, xf86ConfigDir, PROJECTROOT);
++
+   /* Hack for backward compatibility */
+   if (!filename && from == X_DEFAULT)
+     filename = xf86openConfigFile (CONFIGPATH, "XF86Config", PROJECTROOT);
+@@ -137,6 +153,20 @@
+       if (xf86ConfigFile)
+ 	ErrorF (": \"%s\"", xf86ConfigFile);
+       ErrorF ("\n");
++    }
++  if (dirname)
++    {
++      winMsg (from, "Using config directory: \"%s\"\n", dirname);
++    }
++  else
++    {
++      winMsg (X_ERROR, "Unable to locate/open config directory");
++      if (xf86ConfigDir)
++	ErrorF (": \"%s\"", xf86ConfigDir);
++      ErrorF ("\n");
++    }
++  if (!filename && !dirname)
++    {
+       return FALSE;
+     }
+   if ((g_xf86configptr = xf86readConfigFile ()) == NULL)
+Index: xorg-server/hw/xwin/winconfig.h
+===================================================================
+--- xorg-server.orig/hw/xwin/winconfig.h
++++ xorg-server/hw/xwin/winconfig.h
+@@ -188,6 +188,7 @@
+   /* Files */
+ #ifdef XWIN_XF86CONFIG
+   char *configFile;
++  char *configDir;
+ #endif
+   char *fontPath;
+   /* input devices - keyboard */
+Index: xorg-server/hw/xwin/winprocarg.c
+===================================================================
+--- xorg-server.orig/hw/xwin/winprocarg.c
++++ xorg-server/hw/xwin/winprocarg.c
+@@ -1318,6 +1318,24 @@
+     }
+ 
+   /*
++   * Look for the '-configdir' argument
++   */
++  if (IS_OPTION ("-configdir"))
++    {
++      CHECK_ARGS (1);
++#ifdef XWIN_XF86CONFIG
++      g_cmdline.configDir = argv[++i];
++#else
++      winMessageBoxF ("The %s option is not supported in this "
++		      "release.\n"
++		      "Ignoring this option and continuing.\n",
++		      MB_ICONINFORMATION,
++		      argv[i]);
++#endif
++      return 2;
++    }
++
++  /*
+    * Look for the '-keyboard' argument
+    */
+   if (IS_OPTION ("-keyboard"))
+Index: xorg-server/include/xorg-config.h.in
+===================================================================
+--- xorg-server.orig/include/xorg-config.h.in
++++ xorg-server/include/xorg-config.h.in
+@@ -36,6 +36,9 @@
+ /* Path to configuration file. */
+ #undef __XCONFIGFILE__
+ 
++/* Name of configuration directory. */
++#undef __XCONFIGDIR__
++
+ /* Path to loadable modules. */
+ #undef DEFAULT_MODULE_PATH
+ 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-001-inputclass-sans-abi9.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-001-inputclass-sans-abi9.patch
new file mode 100644
index 0000000..fff7b3d
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-001-inputclass-sans-abi9.patch
@@ -0,0 +1,1334 @@
+Merged patches:
+
+9fad8f06fb89ac2ae05bea0fa24cab3df7677297
+b8b12e41c453c3bf94b11e7a18934d3b6e1869bf
+032f97808c65771a07bac748212cf6457a5d1660
+6850ea8fb95417db9ce3a70fc17f90d6fdea1389
+67bc278a511ca6ec42e1f8d2d5897c0109e94e2c
+8b1a685f00ae76be864cc188943a0874f48b8d64
+a378e361a5de89f0be8b68ebc3e854f56cefe666
+9b369f71273fb117c982e6ce16cd4462f206d365
+27d1b86d1b858f931b4cb1b6ddf857c76d92a6d9
+3ac43df5d4a25d6e0058b327fa05a1c1436b4794
+c6d9bc092c84ad5c68083a126aa7577baa42cef7 (apart from config/udev.c change)
+8736d112afb0dd61dfdaadd6378eafd200b2ef5f
+xfree86: merge driver from the input class into the options.
+031f92bf9ab15226df410012a0d1c9c390efc36d
+---
+Index: xorg-server/Xi/stubs.c
+===================================================================
+--- xorg-server.orig/Xi/stubs.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/Xi/stubs.c	2010-03-29 18:32:30.000000000 +0300
+@@ -227,7 +227,8 @@
+  *
+  */
+ int
+-NewInputDeviceRequest(InputOption *options, DeviceIntPtr *pdev)
++NewInputDeviceRequest(InputOption *options, InputAttributes *attrs,
++                      DeviceIntPtr *pdev)
+ {
+     return BadValue;
+ }
+Index: xorg-server/config/dbus.c
+===================================================================
+--- xorg-server.orig/config/dbus.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/config/dbus.c	2010-03-29 18:32:30.000000000 +0300
+@@ -147,7 +147,7 @@
+         dbus_message_iter_next(&iter);
+     }
+ 
+-    ret = NewInputDeviceRequest(options, &dev);
++    ret = NewInputDeviceRequest(options, NULL, &dev);
+     if (ret != Success) {
+         DebugF("[config/dbus] NewInputDeviceRequest failed\n");
+         goto unwind;
+Index: xorg-server/config/hal.c
+===================================================================
+--- xorg-server.orig/config/hal.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/config/hal.c	2010-03-29 19:13:12.000000000 +0300
+@@ -191,6 +191,7 @@
+ {
+     char *path = NULL, *driver = NULL, *name = NULL, *config_info = NULL;
+     InputOption *options = NULL, *tmpo = NULL;
++    InputAttributes attrs = {0};
+     DeviceIntPtr dev = NULL;
+     DBusError error;
+     struct xkb_options xkb_opts = {0};
+@@ -215,10 +216,29 @@
+         LogMessage(X_WARNING,"config/hal: no driver or path specified for %s\n", udi);
+         goto unwind;
+     }
++    attrs.device = xstrdup(path);
+ 
+     name = get_prop_string(hal_ctx, udi, "info.product");
+     if (!name)
+         name = xstrdup("(unnamed)");
++    else
++        attrs.product = xstrdup(name);
++
++    attrs.vendor = get_prop_string(hal_ctx, udi, "info.vendor");
++    attrs.tags = xstrtokenize(get_prop_string(hal_ctx, udi, "input.tags"), ",");
++
++    if (libhal_device_query_capability(hal_ctx, udi, "input.keys", NULL))
++        attrs.flags |= ATTR_KEYBOARD;
++    if (libhal_device_query_capability(hal_ctx, udi, "input.mouse", NULL))
++        attrs.flags |= ATTR_POINTER;
++    if (libhal_device_query_capability(hal_ctx, udi, "input.joystick", NULL))
++        attrs.flags |= ATTR_JOYSTICK;
++    if (libhal_device_query_capability(hal_ctx, udi, "input.tablet", NULL))
++        attrs.flags |= ATTR_TABLET;
++    if (libhal_device_query_capability(hal_ctx, udi, "input.touchpad", NULL))
++        attrs.flags |= ATTR_TOUCHPAD;
++    if (libhal_device_query_capability(hal_ctx, udi, "input.touchscreen", NULL))
++        attrs.flags |= ATTR_TOUCHSCREEN;
+ 
+     options = xcalloc(sizeof(*options), 1);
+     if (!options){
+@@ -400,7 +420,7 @@
+ 
+     /* this isn't an error, but how else do you output something that the user can see? */
+     LogMessage(X_INFO, "config/hal: Adding input device %s\n", name);
+-    if ((rc = NewInputDeviceRequest(options, &dev)) != Success) {
++    if ((rc = NewInputDeviceRequest(options, &attrs, &dev)) != Success) {
+         LogMessage(X_ERROR, "config/hal: NewInputDeviceRequest failed (%d)\n", rc);
+         dev = NULL;
+         goto unwind;
+@@ -430,6 +450,18 @@
+         xfree(tmpo);
+     }
+ 
++    xfree(attrs.product);
++    xfree(attrs.vendor);
++    xfree(attrs.device);
++    if (attrs.tags) {
++        char **tag = attrs.tags;
++        while (*tag) {
++            xfree(*tag);
++            tag++;
++        }
++        xfree(attrs.tags);
++    }
++
+     if (xkb_opts.layout)
+         xfree(xkb_opts.layout);
+     if (xkb_opts.rules)
+Index: xorg-server/configure.ac
+===================================================================
+--- xorg-server.orig/configure.ac	2010-03-29 18:30:35.000000000 +0300
++++ xorg-server/configure.ac	2010-03-29 19:13:12.000000000 +0300
+@@ -119,7 +119,7 @@
+ 
+ AC_HEADER_DIRENT
+ AC_HEADER_STDC
+-AC_CHECK_HEADERS([fcntl.h stdlib.h string.h unistd.h dlfcn.h stropts.h])
++AC_CHECK_HEADERS([fcntl.h stdlib.h string.h unistd.h dlfcn.h stropts.h fnmatch.h])
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+Index: xorg-server/hw/dmx/dmxinput.c
+===================================================================
+--- xorg-server.orig/hw/dmx/dmxinput.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/dmx/dmxinput.c	2010-03-29 18:32:30.000000000 +0300
+@@ -103,7 +103,8 @@
+ }
+ 
+ int
+-NewInputDeviceRequest (InputOption *options, DeviceIntPtr *pdev)
++NewInputDeviceRequest (InputOption *options, InputAttributes *attrs,
++                       DeviceIntPtr *pdev)
+ {
+     return BadRequest;
+ }
+Index: xorg-server/hw/kdrive/src/kinput.c
+===================================================================
+--- xorg-server.orig/hw/kdrive/src/kinput.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/kdrive/src/kinput.c	2010-03-29 19:13:12.000000000 +0300
+@@ -2249,7 +2249,8 @@
+ }
+ 
+ int
+-NewInputDeviceRequest(InputOption *options, DeviceIntPtr *pdev)
++NewInputDeviceRequest(InputOption *options, InputAttributes *attrs,
++                      DeviceIntPtr *pdev)
+ {
+     InputOption *option = NULL;
+     KdPointerInfo *pi = NULL;
+Index: xorg-server/hw/xfree86/common/xf86Option.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Option.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/common/xf86Option.c	2010-03-29 18:30:35.000000000 +0300
+@@ -42,6 +42,7 @@
+ #include "xf86.h"
+ #include "xf86Xinput.h"
+ #include "xf86Optrec.h"
++#include "xf86Parser.h"
+ 
+ static Bool ParseOptionValue(int scrnIndex, pointer options, OptionInfoPtr p,
+ 			     Bool markUsed);
+@@ -456,29 +457,7 @@
+ static Bool
+ GetBoolValue(OptionInfoPtr p, const char *s)
+ {
+-    if (*s == '\0') {
+-	p->value.bool = TRUE;
+-    } else {
+-	if (xf86NameCmp(s, "1") == 0)
+-	    p->value.bool = TRUE;
+-	else if (xf86NameCmp(s, "on") == 0)
+-	    p->value.bool = TRUE;
+-	else if (xf86NameCmp(s, "true") == 0)
+-	    p->value.bool = TRUE;
+-	else if (xf86NameCmp(s, "yes") == 0)
+-	    p->value.bool = TRUE;
+-	else if (xf86NameCmp(s, "0") == 0)
+-	    p->value.bool = FALSE;
+-	else if (xf86NameCmp(s, "off") == 0)
+-	    p->value.bool = FALSE;
+-	else if (xf86NameCmp(s, "false") == 0)
+-	    p->value.bool = FALSE;
+-	else if (xf86NameCmp(s, "no") == 0)
+-	    p->value.bool = FALSE;
+-	else
+-	    return FALSE;
+-    }
+-    return TRUE;
++    return xf86getBoolValue(&p->value.bool, s);
+ }
+ 
+ static Bool
+Index: xorg-server/hw/xfree86/common/xf86Xinput.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Xinput.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/common/xf86Xinput.c	2010-03-29 19:13:12.000000000 +0300
+@@ -57,9 +57,11 @@
+ #include <X11/Xatom.h>
+ #include "xf86.h"
+ #include "xf86Priv.h"
++#include "xf86Config.h"
+ #include "xf86Xinput.h"
+ #include "XIstubs.h"
+ #include "xf86Optrec.h"
++#include "xf86Parser.h"
+ #include "mipointer.h"
+ #include "xf86InPriv.h"
+ #include "compiler.h"
+@@ -74,6 +76,11 @@
+ #include "exglobals.h"
+ #include "eventstr.h"
+ 
++#include <string.h>     /* InputClassMatches */
++#ifdef HAVE_FNMATCH_H
++#include <fnmatch.h>
++#endif
++
+ #include "extnsionst.h"
+ 
+ #include "windowstr.h"	/* screenIsSaved */
+@@ -191,12 +198,12 @@
+ 
+ static void
+ ApplyAccelerationSettings(DeviceIntPtr dev){
+-    int scheme;
++    int scheme, i;
+     DeviceVelocityPtr pVel;
+     LocalDevicePtr local = (LocalDevicePtr)dev->public.devicePrivate;
+     char* schemeStr;
+ 
+-    if(dev->valuator){
++    if (dev->valuator && dev->ptrfeed) {
+ 	schemeStr = xf86SetStrOption(local->options, "AccelerationScheme", "");
+ 
+ 	scheme = dev->valuator->accelScheme.number;
+@@ -239,6 +246,30 @@
+                                               pVel);
+                 break;
+         }
++
++        i = xf86SetIntOption(local->options, "AccelerationNumerator",
++                             dev->ptrfeed->ctrl.num);
++        if (i >= 0)
++            dev->ptrfeed->ctrl.num = i;
++
++        i = xf86SetIntOption(local->options, "AccelerationDenominator",
++                             dev->ptrfeed->ctrl.den);
++        if (i > 0)
++            dev->ptrfeed->ctrl.den = i;
++
++        i = xf86SetIntOption(local->options, "AccelerationThreshold",
++                             dev->ptrfeed->ctrl.threshold);
++        if (i >= 0)
++            dev->ptrfeed->ctrl.threshold = i;
++
++        /* mostly a no-op anyway */
++        (*dev->ptrfeed->CtrlProc)(dev, &dev->ptrfeed->ctrl);
++
++        xf86Msg(X_CONFIG, "%s: (accel) acceleration factor: %.3f\n",
++                            local->name, ((float)dev->ptrfeed->ctrl.num)/
++                                         ((float)dev->ptrfeed->ctrl.den));
++        xf86Msg(X_CONFIG, "%s: (accel) acceleration threshold: %i\n",
++                local->name, dev->ptrfeed->ctrl.threshold);
+     }
+ }
+ 
+@@ -466,6 +497,157 @@
+ {
+ }
+ 
++/*
++ * Classes without any Match statements match all devices. Otherwise, all
++ * statements must match.
++ */
++static Bool
++InputClassMatches(XF86ConfInputClassPtr iclass, InputAttributes *attrs)
++{
++    char **cur;
++    Bool match;
++
++    if (iclass->match_product) {
++        if (!attrs->product)
++            return FALSE;
++        /* see if any of the values match */
++        for (cur = iclass->match_product, match = FALSE; *cur; cur++)
++            if (strstr(attrs->product, *cur)) {
++                match = TRUE;
++                break;
++            }
++        if (!match)
++            return FALSE;
++    }
++    if (iclass->match_vendor) {
++        if (!attrs->vendor)
++            return FALSE;
++        /* see if any of the values match */
++        for (cur = iclass->match_vendor, match = FALSE; *cur; cur++)
++            if (strstr(attrs->vendor, *cur)) {
++                match = TRUE;
++                break;
++            }
++        if (!match)
++            return FALSE;
++    }
++    if (iclass->match_device) {
++        if (!attrs->device)
++            return FALSE;
++        /* see if any of the values match */
++        for (cur = iclass->match_device, match = FALSE; *cur; cur++)
++#ifdef HAVE_FNMATCH_H
++            if (fnmatch(*cur, attrs->device, FNM_PATHNAME) == 0) {
++#else
++            if (strstr(attrs->device, *cur)) {
++#endif
++                match = TRUE;
++                break;
++            }
++        if (!match)
++            return FALSE;
++    }
++    if (iclass->match_tag) {
++        if (!attrs->tags)
++            return FALSE;
++
++        for (cur = iclass->match_tag, match = FALSE; *cur && !match; cur++) {
++            const char *tag;
++            for(tag = *attrs->tags; *tag; tag++) {
++                if (!strcmp(tag, *cur)) {
++                    match = TRUE;
++                    break;
++                }
++            }
++        }
++
++        if (!match)
++            return FALSE;
++    }
++
++    if (iclass->is_keyboard.set &&
++        iclass->is_keyboard.val != !!(attrs->flags & ATTR_KEYBOARD))
++        return FALSE;
++    if (iclass->is_pointer.set &&
++        iclass->is_pointer.val != !!(attrs->flags & ATTR_POINTER))
++        return FALSE;
++    if (iclass->is_joystick.set &&
++        iclass->is_joystick.val != !!(attrs->flags & ATTR_JOYSTICK))
++        return FALSE;
++    if (iclass->is_tablet.set &&
++        iclass->is_tablet.val != !!(attrs->flags & ATTR_TABLET))
++        return FALSE;
++    if (iclass->is_touchpad.set &&
++        iclass->is_touchpad.val != !!(attrs->flags & ATTR_TOUCHPAD))
++        return FALSE;
++    if (iclass->is_touchscreen.set &&
++        iclass->is_touchscreen.val != !!(attrs->flags & ATTR_TOUCHSCREEN))
++        return FALSE;
++    return TRUE;
++}
++
++/*
++ * Merge in any InputClass configurations. Options in each InputClass
++ * section have more priority than the original device configuration as
++ * well as any previous InputClass sections.
++ */
++static int
++MergeInputClasses(IDevPtr idev, InputAttributes *attrs)
++{
++    XF86ConfInputClassPtr cl;
++    XF86OptionPtr classopts, mergedopts = NULL;
++    char *classdriver = NULL;
++
++    for (cl = xf86configptr->conf_inputclass_lst; cl; cl = cl->list.next) {
++        if (!InputClassMatches(cl, attrs))
++            continue;
++
++        /* Collect class options and merge over previous classes */
++        xf86Msg(X_CONFIG, "%s: Applying InputClass \"%s\"\n",
++                idev->identifier, cl->identifier);
++        if (cl->driver)
++            classdriver = cl->driver;
++        classopts = xf86optionListDup(cl->option_lst);
++        mergedopts = xf86optionListMerge(mergedopts, classopts);
++    }
++
++    /* Apply options to device with InputClass settings preferred. */
++    if (classdriver) {
++        xfree(idev->driver);
++        idev->driver = xstrdup(classdriver);
++        if (!idev->driver) {
++            xf86Msg(X_ERROR, "Failed to allocate memory while merging "
++                    "InputClass configuration");
++            return BadAlloc;
++        }
++        mergedopts = xf86ReplaceStrOption(mergedopts, "driver", idev->driver);
++    }
++    idev->commonOptions = xf86optionListMerge(idev->commonOptions, mergedopts);
++
++    return Success;
++}
++
++static Bool
++IgnoreInputClass(IDevPtr idev, InputAttributes *attrs)
++{
++    XF86ConfInputClassPtr cl;
++    Bool ignore;
++
++    for (cl = xf86configptr->conf_inputclass_lst; cl; cl = cl->list.next) {
++        if (!InputClassMatches(cl, attrs))
++            continue;
++        if (xf86findOption(cl->option_lst, "Ignore")) {
++            ignore = xf86CheckBoolOption(cl->option_lst, "Ignore", FALSE);
++            if (ignore)
++                xf86Msg(X_CONFIG,
++                        "%s: Ignoring device from InputClass \"%s\"\n",
++                        idev->identifier, cl->identifier);
++            return ignore;
++        }
++    }
++    return FALSE;
++}
++
+ /**
+  * Create a new input device, activate and enable it.
+  *
+@@ -568,7 +750,8 @@
+ }
+ 
+ int
+-NewInputDeviceRequest (InputOption *options, DeviceIntPtr *pdev)
++NewInputDeviceRequest (InputOption *options, InputAttributes *attrs,
++                       DeviceIntPtr *pdev)
+ {
+     IDevRec *idev = NULL;
+     InputOption *option = NULL;
+@@ -615,6 +798,28 @@
+             }
+         }
+     }
++
++    for (option = options; option; option = option->next) {
++        /* Steal option key/value strings from the provided list.
++         * We need those strings, the InputOption list doesn't. */
++        idev->commonOptions = xf86addNewOption(idev->commonOptions,
++                                               option->key, option->value);
++        option->key = NULL;
++        option->value = NULL;
++    }
++
++    /* Apply InputClass settings */
++    if (attrs) {
++        if (IgnoreInputClass(idev, attrs)) {
++            rval = BadIDChoice;
++            goto unwind;
++        }
++
++        rval = MergeInputClasses(idev, attrs);
++        if (rval != Success)
++            goto unwind;
++    }
++
+     if (!idev->driver || !idev->identifier) {
+         xf86Msg(X_ERROR, "No input driver/identifier specified (ignoring)\n");
+         rval = BadRequest;
+@@ -626,15 +831,6 @@
+         return BadMatch;
+     }
+ 
+-    for (option = options; option; option = option->next) {
+-        /* Steal option key/value strings from the provided list.
+-         * We need those strings, the InputOption list doesn't. */
+-        idev->commonOptions = xf86addNewOption(idev->commonOptions,
+-                                               option->key, option->value);
+-        option->key = NULL;
+-        option->value = NULL;
+-    }
+-
+     rval = xf86NewInputDevice(idev, pdev,
+                 (!is_auto || (is_auto && xf86Info.autoEnableDevices)));
+     if (rval == Success)
+Index: xorg-server/hw/xfree86/doc/man/xorg.conf.man.pre
+===================================================================
+--- xorg-server.orig/hw/xfree86/doc/man/xorg.conf.man.pre	2010-03-29 18:30:35.000000000 +0300
++++ xorg-server/hw/xfree86/doc/man/xorg.conf.man.pre	2010-03-29 18:54:55.000000000 +0300
+@@ -144,6 +144,7 @@
+ .BR "Module         " "Dynamic module loading"
+ .BR "Extensions     " "Extension enabling"
+ .BR "InputDevice    " "Input device description"
++.BR "InputClass     " "Input class description"
+ .BR "Device         " "Graphics device description"
+ .BR "VideoAdaptor   " "Xv video adaptor description"
+ .BR "Monitor        " "Monitor description"
+@@ -957,6 +958,143 @@
+ .B  "predictable   default algorithm (behaving more predictable)"
+ .B  "lightweight   old acceleration code (as specified in the X protocol spec)"
+ .B  "none          no acceleration or deceleration"
++.fi
++.RE
++.TP 7
++.BI "Option \*qAccelerationNumerator\*q  \*q" integer \*q
++.TP 7
++.BI "Option \*qAccelerationDenominator\*q  \*q" integer \*q
++Set numerator and denominator of the acceleration factor. The acceleration
++factor is a rational which, together with threshold, can be used to tweak
++profiles to suit the users needs. The
++.B simple
++and
++.B limited
++profiles use it directly (i.e. they accelerate by the factor), for other
++profiles it should hold that a higher acceleration factor leads to a faster
++pointer. Typically, 1 is unaccelerated and values up to 5 are sensible.
++.TP 7
++.BI "Option \*qAccelerationThreshold\*q  \*q" integer \*q
++Set the threshold, which is roughly the velocity (usually device units per 10
++ms) required for acceleration to become effective. The precise effect varies
++with the profile however.
++
++.SH "INPUTCLASS SECTION"
++The config file may have multiple
++.B InputClass
++sections.
++These sections are optional and are used to provide configuration for a
++class of input devices as they are automatically added. An input device can
++match more than one
++.B InputClass
++section. Each class can override settings from a previous class, so it is
++best to arrange the sections with the most generic matches first.
++.PP
++.B InputClass
++sections have the following format:
++.PP
++.RS 4
++.nf
++.B  "Section \*qInputClass\*q"
++.BI "    Identifier  \*q" name \*q
++.I  "    entries"
++.I  "    ..."
++.I  "    options"
++.I  "    ..."
++.B  "EndSection"
++.fi
++.RE
++.PP
++The
++.B Identifier
++entry is required in all
++.B InputClass
++sections.
++All other entries are optional.
++.PP
++The
++.B Identifier
++entry specifies the unique name for this input class.
++The
++.B Driver
++entry specifies the name of the driver to use for this input device.
++After all classes have been examined, the
++.RI \*q inputdriver \*q
++module from the first
++.B Driver
++entry will be enabled when using the loadable server.
++.PP
++When an input device is automatically added, its characteristics are
++checked against all
++.B InputClass
++sections. Each section can contain optional entries to narrow the match
++of the class. If none of the optional entries appear, the
++.B InputClass
++section is generic and will match any input device. If more than one of
++these entries appear, they all must match for the configuration to apply.
++The allowed matching entries are shown below.
++.PP
++.TP 7
++.BI "MatchProduct  \*q" matchproduct \*q
++This entry can be used to check if the substring
++.RI \*q matchproduct \*q
++occurs in the device's product name. Multiple substrings can be matched by
++separating arguments with a '|' character.
++.TP 7
++.BI "MatchVendor  \*q" matchvendor \*q
++This entry can be used to check if the substring
++.RI \*q matchvendor \*q
++occurs in the device's vendor name. Multiple substrings can be matched by
++separating arguments with a '|' character.
++.TP 7
++.BI "MatchDevicePath \*q" matchdevice \*q
++This entry can be used to check if the device file matches the
++.RI \*q matchdevice \*q
++pathname pattern. Multiple patterns can be matched by separating arguments
++with a '|' character.
++.TP 7
++.BI "MatchTag \*q" matchtag \*q
++This entry can be used to check if tags assigned by the config backend
++matches the
++.RI \*q matchtag \*q
++pattern.  Multiple patterns can be matched by separating arguments
++with a '|' character. A match is found if at least one of the tags given in
++.RI \*q matchtag \*q
++matches at least one of the tags assigned by the backend.
++.TP 7
++.BI "MatchIsKeyboard     \*q" bool \*q
++.TP 7
++.BI "MatchIsPointer      \*q" bool \*q
++.TP 7
++.BI "MatchIsJoystick     \*q" bool \*q
++.TP 7
++.BI "MatchIsTablet       \*q" bool \*q
++.TP 7
++.BI "MatchIsTouchpad     \*q" bool \*q
++.TP 7
++.BI "MatchIsTouchscreen  \*q" bool \*q
++Match device types. These entries take a boolean argument similar to
++.B Option
++entries.
++.PP
++When an input device has been matched to the
++.B InputClass
++section, any
++.B Option
++entries are applied to the device. One
++.B InputClass
++specific
++.B Option
++is recognized. See the
++.B InputDevice
++section above for a description of the remaining
++.B Option
++entries.
++.TP 7
++.BI "Option \*qIgnore\*q \*q" boolean \*q
++This optional entry specifies that the device should be ignored entirely,
++and not added to the server. This can be useful when the device is handled
++by another program and no X events should be generated.
+ .SH "DEVICE SECTION"
+ The config file may have multiple
+ .B Device
+Index: xorg-server/hw/xfree86/parser/Configint.h
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/Configint.h	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/parser/Configint.h	2010-03-29 18:30:35.000000000 +0300
+@@ -148,6 +148,8 @@
+ "The %s keyword requires a number to follow it."
+ #define POSITIVE_INT_MSG \
+ "The %s keyword requires a positive integer to follow it."
++#define BOOL_MSG \
++"The %s keyword requires a boolean to follow it."
+ #define ZAXISMAPPING_MSG \
+ "The ZAxisMapping keyword requires 2 positive numbers or X or Y to follow it."
+ #define AUTOREPEAT_MSG \
+Index: xorg-server/hw/xfree86/parser/InputClass.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ xorg-server/hw/xfree86/parser/InputClass.c	2010-03-29 18:52:20.000000000 +0300
+@@ -0,0 +1,288 @@
++/*
++ * Copyright (c) 2009 Dan Nicholson
++ *
++ * Permission is hereby granted, free of charge, to any person
++ * obtaining a copy of this software and associated documentation
++ * files (the "Software"), to deal in the Software without
++ * restriction, including without limitation the rights to use,
++ * copy, modify, merge, publish, distribute, sublicense, and/or sell
++ * copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following
++ * conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++ * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ * OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/* View/edit this file with tab stops set to 4 */
++
++#ifdef HAVE_XORG_CONFIG_H
++#include <xorg-config.h>
++#endif
++
++#include <string.h>
++#include "os.h"
++#include "xf86Parser.h"
++#include "xf86tokens.h"
++#include "Configint.h"
++
++extern LexRec val;
++
++static
++xf86ConfigSymTabRec InputClassTab[] =
++{
++    {ENDSECTION, "endsection"},
++    {IDENTIFIER, "identifier"},
++    {OPTION, "option"},
++    {DRIVER, "driver"},
++    {MATCH_PRODUCT, "matchproduct"},
++    {MATCH_VENDOR, "matchvendor"},
++    {MATCH_DEVICE_PATH, "matchdevicepath"},
++    {MATCH_TAG, "matchtag"},
++    {MATCH_IS_KEYBOARD, "matchiskeyboard"},
++    {MATCH_IS_POINTER, "matchispointer"},
++    {MATCH_IS_JOYSTICK, "matchisjoystick"},
++    {MATCH_IS_TABLET, "matchistablet"},
++    {MATCH_IS_TOUCHPAD, "matchistouchpad"},
++    {MATCH_IS_TOUCHSCREEN, "matchistouchscreen"},
++    {-1, ""},
++};
++
++#define CLEANUP xf86freeInputClassList
++
++#define TOKEN_SEP "|"
++
++XF86ConfInputClassPtr
++xf86parseInputClassSection(void)
++{
++    int has_ident = FALSE;
++    int token;
++
++    parsePrologue(XF86ConfInputClassPtr, XF86ConfInputClassRec)
++
++    while ((token = xf86getToken(InputClassTab)) != ENDSECTION) {
++        switch (token) {
++        case COMMENT:
++            ptr->comment = xf86addComment(ptr->comment, val.str);
++            break;
++        case IDENTIFIER:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "Identifier");
++            if (has_ident == TRUE)
++                Error(MULTIPLE_MSG, "Identifier");
++            ptr->identifier = val.str;
++            has_ident = TRUE;
++            break;
++        case DRIVER:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "Driver");
++            if (strcmp(val.str, "keyboard") == 0)
++                ptr->driver = "kbd";
++            else
++                ptr->driver = val.str;
++            break;
++        case OPTION:
++            ptr->option_lst = xf86parseOption(ptr->option_lst);
++            break;
++        case MATCH_PRODUCT:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchProduct");
++            ptr->match_product = xstrtokenize(val.str, TOKEN_SEP);
++            break;
++        case MATCH_VENDOR:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchVendor");
++            ptr->match_vendor = xstrtokenize(val.str, TOKEN_SEP);
++            break;
++        case MATCH_DEVICE_PATH:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchDevicePath");
++            ptr->match_device = xstrtokenize(val.str, TOKEN_SEP);
++            break;
++        case MATCH_TAG:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchTag");
++            ptr->match_tag = xstrtokenize(val.str, TOKEN_SEP);
++            break;
++        case MATCH_IS_KEYBOARD:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchIsKeyboard");
++            ptr->is_keyboard.set = xf86getBoolValue(&ptr->is_keyboard.val,
++                                                    val.str);
++            if (!ptr->is_keyboard.set)
++                Error(BOOL_MSG, "MatchIsKeyboard");
++            break;
++        case MATCH_IS_POINTER:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchIsPointer");
++            ptr->is_pointer.set = xf86getBoolValue(&ptr->is_pointer.val,
++                                                   val.str);
++            if (!ptr->is_pointer.set)
++                Error(BOOL_MSG, "MatchIsPointer");
++            break;
++        case MATCH_IS_JOYSTICK:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchIsJoystick");
++            ptr->is_joystick.set = xf86getBoolValue(&ptr->is_joystick.val,
++                                                    val.str);
++            if (!ptr->is_joystick.set)
++                Error(BOOL_MSG, "MatchIsJoystick");
++            break;
++        case MATCH_IS_TABLET:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchIsTablet");
++            ptr->is_tablet.set = xf86getBoolValue(&ptr->is_tablet.val,
++                                                  val.str);
++            if (!ptr->is_tablet.set)
++                Error(BOOL_MSG, "MatchIsTablet");
++            break;
++        case MATCH_IS_TOUCHPAD:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchIsTouchpad");
++            ptr->is_touchpad.set = xf86getBoolValue(&ptr->is_touchpad.val,
++                                                    val.str);
++            if (!ptr->is_touchpad.set)
++                Error(BOOL_MSG, "MatchIsTouchpad");
++            break;
++        case MATCH_IS_TOUCHSCREEN:
++            if (xf86getSubToken(&(ptr->comment)) != STRING)
++                Error(QUOTE_MSG, "MatchIsTouchscreen");
++            ptr->is_touchscreen.set = xf86getBoolValue(&ptr->is_touchscreen.val,
++                                                       val.str);
++            if (!ptr->is_touchscreen.set)
++                Error(BOOL_MSG, "MatchIsTouchscreen");
++            break;
++        case EOF_TOKEN:
++            Error(UNEXPECTED_EOF_MSG, NULL);
++            break;
++        default:
++            Error(INVALID_KEYWORD_MSG, xf86tokenString ());
++            break;
++        }
++    }
++
++    if (!has_ident)
++        Error(NO_IDENT_MSG, NULL);
++
++#ifdef DEBUG
++    printf("InputClass section parsed\n");
++#endif
++
++    return ptr;
++}
++
++void
++xf86printInputClassSection (FILE * cf, XF86ConfInputClassPtr ptr)
++{
++    char **list;
++
++    while (ptr) {
++        fprintf(cf, "Section \"InputClass\"\n");
++        if (ptr->comment)
++            fprintf(cf, "%s", ptr->comment);
++        if (ptr->identifier)
++            fprintf(cf, "\tIdentifier      \"%s\"\n", ptr->identifier);
++        if (ptr->driver)
++            fprintf(cf, "\tDriver          \"%s\"\n", ptr->driver);
++        if (ptr->match_product) {
++            fprintf(cf, "\tMatchProduct    \"");
++            for (list = ptr->match_product; *list; list++)
++                fprintf(cf, "%s%s",
++                        list == ptr->match_product ? "" : TOKEN_SEP,
++                        *list);
++            fprintf(cf, "\"\n");
++        }
++        if (ptr->match_vendor) {
++            fprintf(cf, "\tMatchVendor     \"");
++            for (list = ptr->match_vendor; *list; list++)
++                fprintf(cf, "%s%s",
++                        list == ptr->match_vendor ? "" : TOKEN_SEP,
++                        *list);
++            fprintf(cf, "\"\n");
++        }
++        if (ptr->match_device) {
++            fprintf(cf, "\tMatchDevicePath \"");
++            for (list = ptr->match_device; *list; list++)
++                fprintf(cf, "%s%s",
++                        list == ptr->match_device ? "" : TOKEN_SEP,
++                        *list);
++            fprintf(cf, "\"\n");
++        }
++        if (ptr->match_tag) {
++            fprintf(cf, "\tMatchTag \"");
++            for (list = ptr->match_tag; *list; list++)
++                fprintf(cf, "%s%s",
++                        list == ptr->match_tag ? "" : TOKEN_SEP,
++                        *list);
++            fprintf(cf, "\"\n");
++        }
++        if (ptr->is_keyboard.set)
++            fprintf(cf, "\tIsKeyboard      \"%s\"\n",
++                    ptr->is_keyboard.val ? "yes" : "no");
++        if (ptr->is_pointer.set)
++            fprintf(cf, "\tIsPointer       \"%s\"\n",
++                    ptr->is_pointer.val ? "yes" : "no");
++        if (ptr->is_joystick.set)
++            fprintf(cf, "\tIsJoystick      \"%s\"\n",
++                    ptr->is_joystick.val ? "yes" : "no");
++        if (ptr->is_tablet.set)
++            fprintf(cf, "\tIsTablet        \"%s\"\n",
++                    ptr->is_tablet.val ? "yes" : "no");
++        if (ptr->is_touchpad.set)
++            fprintf(cf, "\tIsTouchpad      \"%s\"\n",
++                    ptr->is_touchpad.val ? "yes" : "no");
++        if (ptr->is_touchscreen.set)
++            fprintf(cf, "\tIsTouchscreen   \"%s\"\n",
++                    ptr->is_touchscreen.val ? "yes" : "no");
++        xf86printOptionList(cf, ptr->option_lst, 1);
++        fprintf(cf, "EndSection\n\n");
++        ptr = ptr->list.next;
++    }
++}
++
++void
++xf86freeInputClassList (XF86ConfInputClassPtr ptr)
++{
++    XF86ConfInputClassPtr prev;
++    char **list;
++
++    while (ptr) {
++        TestFree(ptr->identifier);
++        TestFree(ptr->driver);
++        if (ptr->match_product) {
++            for (list = ptr->match_product; *list; list++)
++                free(*list);
++            free(ptr->match_product);
++        }
++        if (ptr->match_vendor) {
++            for (list = ptr->match_vendor; *list; list++)
++                free(*list);
++            free(ptr->match_vendor);
++        }
++        if (ptr->match_device) {
++            for (list = ptr->match_device; *list; list++)
++                free(*list);
++            free(ptr->match_device);
++        }
++        if (ptr->match_tag) {
++            for (list = ptr->match_tag; *list; list++)
++                free(*list);
++            free(ptr->match_tag);
++        }
++        TestFree(ptr->comment);
++        xf86optionListFree(ptr->option_lst);
++
++        prev = ptr;
++        ptr = ptr->list.next;
++        free(prev);
++    }
++}
+Index: xorg-server/hw/xfree86/parser/Makefile.am
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/Makefile.am	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/parser/Makefile.am	2010-03-29 18:30:35.000000000 +0300
+@@ -13,6 +13,7 @@
+ 	Files.c \
+ 	Flags.c \
+ 	Input.c \
++	InputClass.c \
+ 	Layout.c \
+ 	Module.c \
+ 	Video.c \
+Index: xorg-server/hw/xfree86/parser/configProcs.h
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/configProcs.h	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/parser/configProcs.h	2010-03-29 18:30:35.000000000 +0300
+@@ -48,6 +48,10 @@
+ void xf86printInputSection(FILE *f, XF86ConfInputPtr ptr);
+ void xf86freeInputList(XF86ConfInputPtr ptr);
+ int xf86validateInput (XF86ConfigPtr p);
++/* InputClass.c */
++XF86ConfInputClassPtr xf86parseInputClassSection(void);
++void xf86printInputClassSection(FILE *f, XF86ConfInputClassPtr ptr);
++void xf86freeInputClassList(XF86ConfInputClassPtr ptr);
+ /* Layout.c */
+ XF86ConfLayoutPtr xf86parseLayoutSection(void);
+ void xf86printLayoutSection(FILE *cf, XF86ConfLayoutPtr ptr);
+Index: xorg-server/hw/xfree86/parser/read.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/read.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/parser/read.c	2010-03-29 18:30:35.000000000 +0300
+@@ -177,6 +177,14 @@
+ 				HANDLE_LIST (conf_input_lst, xf86parseInputSection,
+ 							 XF86ConfInputPtr);
+ 			}
++			else if (xf86nameCompare(val.str, "inputclass") == 0)
++			{
++				free(val.str);
++				val.str = NULL;
++				HANDLE_LIST (conf_inputclass_lst,
++						xf86parseInputClassSection,
++						XF86ConfInputClassPtr);
++			}
+ 			else if (xf86nameCompare (val.str, "module") == 0)
+ 			{
+ 				free(val.str);
+Index: xorg-server/hw/xfree86/parser/scan.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/scan.c	2010-03-29 18:30:35.000000000 +0300
++++ xorg-server/hw/xfree86/parser/scan.c	2010-03-29 19:13:24.000000000 +0300
+@@ -227,13 +227,15 @@
+ 			    configFiles[curFileIndex].file);
+ 
+ 		if (!ret) {
+-			/* stop if there are no more files */
+-			if (++curFileIndex >= numFiles) {
+-				curFileIndex = 0;
++			/*
++			 * if the file doesn't end in a newline, add one
++			 * and trigger another read
++			 */
++			if (pos != 0) {
++				strcpy(&configBuf[pos], "\n");
++				ret = configBuf;
++			} else
+ 				break;
+-			}
+-			configLineNo = 0;
+-			continue;
+ 		}
+ 
+ 		/* search for EOL in the new block of chars */
+@@ -338,7 +340,17 @@
+ 			}
+ 			if (ret == NULL)
+ 			{
+-				return (pushToken = EOF_TOKEN);
++				/*
++				 * if necessary, move to the next file and
++				 * read the first line
++				 */
++				if (curFileIndex + 1 < numFiles) {
++					curFileIndex++;
++					configLineNo = 0;
++					goto again;
++				}
++				else
++					return (pushToken = EOF_TOKEN);
+ 			}
+ 			configLineNo++;
+ 			configPos = 0;
+@@ -1186,3 +1198,33 @@
+ 
+ 	return (cur);
+ }
++
++Bool
++xf86getBoolValue(Bool *val, const char *str)
++{
++	if (!val || !str)
++		return FALSE;
++	if (*str == '\0') {
++		*val = TRUE;
++	} else {
++		if (xf86nameCompare(str, "1") == 0)
++			*val = TRUE;
++		else if (xf86nameCompare(str, "on") == 0)
++			*val = TRUE;
++		else if (xf86nameCompare(str, "true") == 0)
++			*val = TRUE;
++		else if (xf86nameCompare(str, "yes") == 0)
++			*val = TRUE;
++		else if (xf86nameCompare(str, "0") == 0)
++			*val = FALSE;
++		else if (xf86nameCompare(str, "off") == 0)
++			*val = FALSE;
++		else if (xf86nameCompare(str, "false") == 0)
++			*val = FALSE;
++		else if (xf86nameCompare(str, "no") == 0)
++			*val = FALSE;
++		else
++			return FALSE;
++	}
++	return TRUE;
++}
+Index: xorg-server/hw/xfree86/parser/write.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/write.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/parser/write.c	2010-03-29 18:30:35.000000000 +0300
+@@ -117,6 +117,8 @@
+ 
+ 	xf86printInputSection (cf, cptr->conf_input_lst);
+ 
++	xf86printInputClassSection (cf, cptr->conf_inputclass_lst);
++
+ 	xf86printVideoAdaptorSection (cf, cptr->conf_videoadaptor_lst);
+ 
+ 	xf86printModesSection (cf, cptr->conf_modes_lst);
+Index: xorg-server/hw/xfree86/parser/xf86Parser.h
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/xf86Parser.h	2010-03-29 18:30:35.000000000 +0300
++++ xorg-server/hw/xfree86/parser/xf86Parser.h	2010-03-29 18:52:20.000000000 +0300
+@@ -64,6 +64,7 @@
+ #ifndef _xf86Parser_h_
+ #define _xf86Parser_h_
+ 
++#include <X11/Xdefs.h>
+ #include "xf86Optrec.h"
+ 
+ #define HAVE_PARSER_DECLS
+@@ -330,6 +331,33 @@
+ }
+ XF86ConfInputrefRec, *XF86ConfInputrefPtr;
+ 
++typedef struct
++{
++	Bool set;
++	Bool val;
++}
++xf86TriState;
++
++typedef struct
++{
++	GenericListRec list;
++	char *identifier;
++	char *driver;
++	char **match_product;
++	char **match_vendor;
++	char **match_device;
++	char **match_tag;
++	xf86TriState is_keyboard;
++	xf86TriState is_pointer;
++	xf86TriState is_joystick;
++	xf86TriState is_tablet;
++	xf86TriState is_touchpad;
++	xf86TriState is_touchscreen;
++	XF86OptionPtr option_lst;
++	char *comment;
++}
++XF86ConfInputClassRec, *XF86ConfInputClassPtr;
++
+ /* Values for adj_where */
+ #define CONF_ADJ_OBSOLETE	-1
+ #define CONF_ADJ_ABSOLUTE	0
+@@ -438,6 +466,7 @@
+ 	XF86ConfDevicePtr conf_device_lst;
+ 	XF86ConfScreenPtr conf_screen_lst;
+ 	XF86ConfInputPtr conf_input_lst;
++	XF86ConfInputClassPtr conf_inputclass_lst;
+ 	XF86ConfLayoutPtr conf_layout_lst;
+ 	XF86ConfVendorPtr conf_vendor_lst;
+ 	XF86ConfDRIPtr conf_dri;
+@@ -484,5 +513,6 @@
+ extern _X_EXPORT int xf86pathIsAbsolute(const char *path);
+ extern _X_EXPORT int xf86pathIsSafe(const char *path);
+ extern _X_EXPORT char *xf86addComment(char *cur, char *add);
++extern _X_EXPORT Bool xf86getBoolValue(Bool *val, const char *str);
+ 
+ #endif /* _xf86Parser_h_ */
+Index: xorg-server/hw/xfree86/parser/xf86tokens.h
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/xf86tokens.h	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xfree86/parser/xf86tokens.h	2010-03-29 18:52:20.000000000 +0300
+@@ -273,7 +273,19 @@
+ 
+     /* DRI Tokens */
+     GROUP,
+-    BUFFERS
++    BUFFERS,
++
++    /* InputClass Tokens */
++    MATCH_PRODUCT,
++    MATCH_VENDOR,
++    MATCH_DEVICE_PATH,
++    MATCH_TAG,
++    MATCH_IS_KEYBOARD,
++    MATCH_IS_POINTER,
++    MATCH_IS_JOYSTICK,
++    MATCH_IS_TABLET,
++    MATCH_IS_TOUCHPAD,
++    MATCH_IS_TOUCHSCREEN
+ } ParserTokens;
+ 
+ #endif /* _xf86_tokens_h */
+Index: xorg-server/hw/xquartz/darwinXinput.c
+===================================================================
+--- xorg-server.orig/hw/xquartz/darwinXinput.c	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/hw/xquartz/darwinXinput.c	2010-03-29 18:32:30.000000000 +0300
+@@ -230,7 +230,8 @@
+  *
+  */
+ int
+-NewInputDeviceRequest(InputOption *options, DeviceIntPtr *pdev)
++NewInputDeviceRequest(InputOption *options, InputAttributes *attrs,
++                      DeviceIntPtr *pdev)
+ {
+   DEBUG_LOG("NewInputDeviceRequest(%p, %p)\n", options, pdev);
+   return BadValue;
+Index: xorg-server/include/dix-config.h.in
+===================================================================
+--- xorg-server.orig/include/dix-config.h.in	2010-03-29 18:30:35.000000000 +0300
++++ xorg-server/include/dix-config.h.in	2010-03-29 19:13:12.000000000 +0300
+@@ -225,6 +225,9 @@
+ /* Define to 1 if you have the <unistd.h> header file. */
+ #undef HAVE_UNISTD_H
+ 
++/* Define to 1 if you have the <fnmatch.h> header file. */
++#undef HAVE_FNMATCH_H
++
+ /* Have /dev/urandom */
+ #undef HAVE_URANDOM
+ 
+Index: xorg-server/include/input.h
+===================================================================
+--- xorg-server.orig/include/input.h	2010-03-29 18:29:58.000000000 +0300
++++ xorg-server/include/input.h	2010-03-29 18:52:20.000000000 +0300
+@@ -52,6 +52,7 @@
+ #include "screenint.h"
+ #include <X11/Xmd.h>
+ #include <X11/Xproto.h>
++#include <stdint.h>
+ #include "window.h"     /* for WindowPtr */
+ #include "xkbrules.h"
+ #include "events.h"
+@@ -210,6 +211,21 @@
+     struct _InputOption *next;
+ } InputOption;
+ 
++typedef struct _InputAttributes {
++    char                *product;
++    char                *vendor;
++    char                *device;
++    char                **tags; /* null-terminated */
++    uint32_t            flags;
++} InputAttributes;
++
++#define ATTR_KEYBOARD (1<<0)
++#define ATTR_POINTER (1<<1)
++#define ATTR_JOYSTICK (1<<2)
++#define ATTR_TABLET (1<<3)
++#define ATTR_TOUCHPAD (1<<4)
++#define ATTR_TOUCHSCREEN (1<<5)
++
+ /* Key has been run through all input processing and events sent to clients. */
+ #define KEY_PROCESSED 1
+ /* Key has not been fully processed, no events have been sent. */
+@@ -514,6 +530,7 @@
+ /* Implemented by the DDX. */
+ extern _X_EXPORT int NewInputDeviceRequest(
+     InputOption *options,
++    InputAttributes *attrs,
+     DeviceIntPtr *dev);
+ extern  _X_EXPORT void DeleteInputDeviceRequest(
+     DeviceIntPtr dev);
+Index: xorg-server/include/misc.h
+===================================================================
+--- xorg-server.orig/include/misc.h	2010-03-29 18:46:43.000000000 +0300
++++ xorg-server/include/misc.h	2010-03-29 18:49:34.000000000 +0300
+@@ -210,6 +210,9 @@
+     return (((bytes) + 3) & ~3);
+ }
+ 
++extern char**
++xstrtokenize(const char *str, const char* separators);
++
+ /* some macros to help swap requests, replies, and events */
+ 
+ #define LengthRestB(stuff) \
+Index: xorg-server/os/utils.c
+===================================================================
+--- xorg-server.orig/os/utils.c	2010-03-29 18:46:43.000000000 +0300
++++ xorg-server/os/utils.c	2010-03-29 18:49:34.000000000 +0300
+@@ -1870,6 +1870,46 @@
+ #endif
+ }
+ 
++/*
++ * Tokenize a string into a NULL terminated array of strings. Always returns
++ * an allocated array unless an error occurs.
++ */
++char**
++xstrtokenize(const char *str, const char *separators)
++{
++    char **list, **nlist;
++    char *tok, *tmp;
++    unsigned num = 0, n;
++
++    if (!str)
++        return NULL;
++    list = calloc(1, sizeof(*list));
++    if (!list)
++        return NULL;
++    tmp = strdup(str);
++    if (!tmp)
++        goto error;
++    for (tok = strtok(tmp, separators); tok; tok = strtok(NULL, separators)) {
++        nlist = realloc(list, (num + 2) * sizeof(*list));
++        if (!nlist)
++            goto error;
++        list = nlist;
++        list[num] = strdup(tok);
++        if (!list[num])
++            goto error;
++        list[++num] = NULL;
++    }
++    free(tmp);
++    return list;
++
++error:
++    free(tmp);
++    for (n = 0; n < num; n++)
++        free(list[n]);
++    free(list);
++    return NULL;
++}
++
+ #ifdef __SCO__
+ #include <fcntl.h>
+ 
+Index: xorg-server/hw/xfree86/common/xf86Config.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Config.c	2010-03-29 18:42:09.000000000 +0300
++++ xorg-server/hw/xfree86/common/xf86Config.c	2010-03-29 19:13:12.000000000 +0300
+@@ -2492,8 +2492,8 @@
+ 	    dirfrom = X_CMDLINE;
+ 
+ 	xf86initConfigFiles();
+-	filename = xf86openConfigFile(filesearch, xf86ConfigFile, PROJECTROOT);
+ 	dirname = xf86openConfigDirFiles(dirsearch, xf86ConfigDir, PROJECTROOT);
++	filename = xf86openConfigFile(filesearch, xf86ConfigFile, PROJECTROOT);
+ 	if (filename) {
+ 	    xf86MsgVerb(filefrom, 0, "Using config file: \"%s\"\n", filename);
+ 	    xf86ConfigFile = xnfstrdup(filename);
+Index: xorg-server/hw/xwin/winconfig.c
+===================================================================
+--- xorg-server.orig/hw/xwin/winconfig.c	2010-03-29 18:32:58.000000000 +0300
++++ xorg-server/hw/xwin/winconfig.c	2010-03-29 18:54:55.000000000 +0300
+@@ -136,8 +136,8 @@
+ 
+   /* Parse config file into data structure */
+   xf86initConfigFiles();
+-  filename = xf86openConfigFile (CONFIGPATH, xf86ConfigFile, PROJECTROOT);
+   dirname = xf86openConfigDirFiles (CONFIGDIRPATH, xf86ConfigDir, PROJECTROOT);
++  filename = xf86openConfigFile (CONFIGPATH, xf86ConfigFile, PROJECTROOT);
+ 
+   /* Hack for backward compatibility */
+   if (!filename && from == X_DEFAULT)
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-002-config-libudev-backend.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-002-config-libudev-backend.patch
new file mode 100644
index 0000000..1de16e5
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-002-config-libudev-backend.patch
@@ -0,0 +1,729 @@
+Merged patches:
+
+435f27667f84269768efecde34de4af2b2d43376
+84905007702da2c05a4f7446b3fc5ff52be49655
+c6d9bc092c84ad5c68083a126aa7577baa42cef7 (only the config/udev.c change)
+aa91508356f243edc3b11795b1481edcfe0d39c2
+
+---
+Index: xorg-server/config/Makefile.am
+===================================================================
+--- xorg-server.orig/config/Makefile.am
++++ xorg-server/config/Makefile.am
+@@ -1,12 +1,20 @@
+-AM_CFLAGS = @DIX_CFLAGS@
++AM_CFLAGS = $(DIX_CFLAGS)
+ 
+ noinst_LTLIBRARIES = libconfig.la
+ libconfig_la_SOURCES = config.c config-backends.h
+ 
++if CONFIG_UDEV
++
++AM_CFLAGS += $(UDEV_CFLAGS)
++libconfig_la_SOURCES += udev.c
++libconfig_la_LIBADD = $(UDEV_LIBS)
++
++else
++
+ if CONFIG_NEED_DBUS
+-AM_CFLAGS += @DBUS_CFLAGS@
++AM_CFLAGS += $(DBUS_CFLAGS)
+ libconfig_la_SOURCES += dbus-core.c
+-endif
++libconfig_la_LIBADD = $(DBUS_LIBS)
+ 
+ if CONFIG_DBUS_API
+ dbusconfigdir = $(sysconfdir)/dbus-1/system.d
+@@ -16,7 +24,13 @@ libconfig_la_SOURCES += dbus.c
+ endif
+ 
+ if CONFIG_HAL
++AM_CFLAGS += $(HAL_CFLAGS)
+ libconfig_la_SOURCES += hal.c
++libconfig_la_LIBADD += $(HAL_LIBS)
+ endif
+ 
++endif # CONFIG_NEED_DBUS
++
++endif # !CONFIG_UDEV
++
+ EXTRA_DIST = xorg-server.conf x11-input.fdi
+Index: xorg-server/config/config-backends.h
+===================================================================
+--- xorg-server.orig/config/config-backends.h
++++ xorg-server/config/config-backends.h
+@@ -26,8 +26,18 @@
+ #ifdef HAVE_DIX_CONFIG_H
+ #include <dix-config.h>
+ #endif
++#include "input.h"
+ 
+-#ifdef CONFIG_NEED_DBUS
++void remove_devices(const char *backend, const char *config_info);
++BOOL device_is_duplicate(const char *config_info);
++void add_option(InputOption **options, const char *key, const char *value);
++
++#ifdef CONFIG_UDEV
++int config_udev_init(void);
++void config_udev_fini(void);
++#else
++
++# ifdef CONFIG_NEED_DBUS
+ #include <dbus/dbus.h>
+ 
+ typedef void (*config_dbus_core_connect_hook)(DBusConnection *connection,
+@@ -46,14 +56,15 @@ int config_dbus_core_init(void);
+ void config_dbus_core_fini(void);
+ int config_dbus_core_add_hook(struct config_dbus_core_hook *hook);
+ void config_dbus_core_remove_hook(struct config_dbus_core_hook *hook);
+-#endif
++# endif
+ 
+-#ifdef CONFIG_DBUS_API
++# ifdef CONFIG_DBUS_API
+ int config_dbus_init(void);
+ void config_dbus_fini(void);
+-#endif
++# endif
+ 
+-#ifdef CONFIG_HAL
++# ifdef CONFIG_HAL
+ int config_hal_init(void);
+ void config_hal_fini(void);
++# endif
+ #endif
+Index: xorg-server/config/config.c
+===================================================================
+--- xorg-server.orig/config/config.c
++++ xorg-server/config/config.c
+@@ -28,13 +28,17 @@
+ #endif
+ 
+ #include "os.h"
++#include "inputstr.h"
+ #include "hotplug.h"
+ #include "config-backends.h"
+ 
+ void
+ config_init(void)
+ {
+-#if defined(CONFIG_DBUS_API) || defined(CONFIG_HAL)
++#ifdef CONFIG_UDEV
++    if (!config_udev_init())
++        ErrorF("[config] failed to initialise udev\n");
++#elif defined(CONFIG_NEED_DBUS)
+     if (config_dbus_core_init()) {
+ # ifdef CONFIG_DBUS_API
+        if (!config_dbus_init())
+@@ -54,7 +58,9 @@ config_init(void)
+ void
+ config_fini(void)
+ {
+-#if defined(CONFIG_DBUS_API) || defined(CONFIG_HAL)
++#if defined(CONFIG_UDEV)
++    config_udev_fini();
++#elif defined(CONFIG_NEED_DBUS)
+ # ifdef CONFIG_HAL
+     config_hal_fini();
+ # endif
+@@ -64,3 +70,70 @@ config_fini(void)
+     config_dbus_core_fini();
+ #endif
+ }
++
++static void
++remove_device(const char *backend, DeviceIntPtr dev)
++{
++    /* this only gets called for devices that have already been added */
++    LogMessage(X_INFO, "config/%s: removing device %s\n", backend, dev->name);
++
++    /* Call PIE here so we don't try to dereference a device that's
++     * already been removed. */
++    OsBlockSignals();
++    ProcessInputEvents();
++    DeleteInputDeviceRequest(dev);
++    OsReleaseSignals();
++}
++
++void
++remove_devices(const char *backend, const char *config_info)
++{
++    DeviceIntPtr dev, next;
++
++    for (dev = inputInfo.devices; dev; dev = next) {
++        next = dev->next;
++        if (dev->config_info && strcmp(dev->config_info, config_info) == 0)
++            remove_device(backend, dev);
++    }
++    for (dev = inputInfo.off_devices; dev; dev = next) {
++        next = dev->next;
++        if (dev->config_info && strcmp(dev->config_info, config_info) == 0)
++            remove_device(backend, dev);
++    }
++}
++
++BOOL
++device_is_duplicate(const char *config_info)
++{
++    DeviceIntPtr dev;
++
++    for (dev = inputInfo.devices; dev; dev = dev->next)
++    {
++        if (dev->config_info && (strcmp(dev->config_info, config_info) == 0))
++            return TRUE;
++    }
++
++    for (dev = inputInfo.off_devices; dev; dev = dev->next)
++    {
++        if (dev->config_info && (strcmp(dev->config_info, config_info) == 0))
++            return TRUE;
++    }
++
++    return FALSE;
++}
++
++void
++add_option(InputOption **options, const char *key, const char *value)
++{
++    if (!value || *value == '\0')
++        return;
++
++    for (; *options; options = &(*options)->next)
++        ;
++    *options = xcalloc(sizeof(**options), 1);
++    if (!*options) /* Yeesh. */
++        return;
++    (*options)->key = xstrdup(key);
++    (*options)->value = xstrdup(value);
++    (*options)->next = NULL;
++}
+Index: xorg-server/config/hal.c
+===================================================================
+--- xorg-server.orig/config/hal.c
++++ xorg-server/config/hal.c
+@@ -58,25 +58,9 @@ struct xkb_options {
+     char* options;
+ };
+ 
+-
+-static void
+-remove_device(DeviceIntPtr dev)
+-{
+-    /* this only gets called for devices that have already been added */
+-    LogMessage(X_INFO, "config/hal: removing device %s\n", dev->name);
+-
+-    /* Call PIE here so we don't try to dereference a device that's
+-     * already been removed. */
+-    OsBlockSignals();
+-    ProcessInputEvents();
+-    DeleteInputDeviceRequest(dev);
+-    OsReleaseSignals();
+-}
+-
+ static void
+ device_removed(LibHalContext *ctx, const char *udi)
+ {
+-    DeviceIntPtr dev, next;
+     char *value;
+ 
+     value = xalloc(strlen(udi) + 5); /* "hal:" + NULL */
+@@ -84,36 +68,11 @@ device_removed(LibHalContext *ctx, const
+         return;
+     sprintf(value, "hal:%s", udi);
+ 
+-    for (dev = inputInfo.devices; dev; dev = next) {
+-	next = dev->next;
+-        if (dev->config_info && strcmp(dev->config_info, value) == 0)
+-            remove_device(dev);
+-    }
+-    for (dev = inputInfo.off_devices; dev; dev = next) {
+-	next = dev->next;
+-        if (dev->config_info && strcmp(dev->config_info, value) == 0)
+-            remove_device(dev);
+-    }
++    remove_devices("hal", value);
+ 
+     xfree(value);
+ }
+ 
+-static void
+-add_option(InputOption **options, const char *key, const char *value)
+-{
+-    if (!value || *value == '\0')
+-        return;
+-
+-    for (; *options; options = &(*options)->next)
+-        ;
+-    *options = xcalloc(sizeof(**options), 1);
+-    if (!*options) /* Yeesh. */
+-        return;
+-    (*options)->key = xstrdup(key);
+-    (*options)->value = xstrdup(value);
+-    (*options)->next = NULL;
+-}
+-
+ static char *
+ get_prop_string(LibHalContext *hal_ctx, const char *udi, const char *name)
+ {
+@@ -166,26 +125,6 @@ get_prop_string_array(LibHalContext *hal
+     return ret;
+ }
+ 
+-static BOOL
+-device_is_duplicate(char *config_info)
+-{
+-    DeviceIntPtr dev;
+-
+-    for (dev = inputInfo.devices; dev; dev = dev->next)
+-    {
+-        if (dev->config_info && (strcmp(dev->config_info, config_info) == 0))
+-            return TRUE;
+-    }
+-
+-    for (dev = inputInfo.off_devices; dev; dev = dev->next)
+-    {
+-        if (dev->config_info && (strcmp(dev->config_info, config_info) == 0))
+-            return TRUE;
+-    }
+-
+-    return FALSE;
+-}
+-
+ static void
+ device_added(LibHalContext *hal_ctx, const char *udi)
+ {
+Index: xorg-server/config/udev.c
+===================================================================
+--- /dev/null
++++ xorg-server/config/udev.c
+@@ -0,0 +1,267 @@
++/*
++ * Copyright ? 2009 Julien Cristau
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ *
++ * Author: Julien Cristau <jcristau@debian.org>
++ */
++
++#ifdef HAVE_DIX_CONFIG_H
++#include <dix-config.h>
++#endif
++
++#include <libudev.h>
++
++#include "input.h"
++#include "inputstr.h"
++#include "hotplug.h"
++#include "config-backends.h"
++#include "os.h"
++
++#define UDEV_XKB_PROP_KEY "xkb"
++
++static struct udev_monitor *udev_monitor;
++
++static void
++device_added(struct udev_device *udev_device)
++{
++    const char *path, *name = NULL;
++    char *config_info = NULL;
++    const char *syspath;
++    const char *key, *value, *tmp;
++    InputOption *options = NULL, *tmpo;
++    InputAttributes attrs = {};
++    DeviceIntPtr dev = NULL;
++    struct udev_list_entry *set, *entry;
++    struct udev_device *parent;
++    int rc;
++
++    path = udev_device_get_devnode(udev_device);
++
++    syspath = udev_device_get_syspath(udev_device);
++
++    if (!path || !syspath)
++        return;
++
++    if (!udev_device_get_property_value(udev_device, "ID_INPUT"))
++        return;
++
++    options = xcalloc(sizeof(*options), 1);
++    if (!options)
++        return;
++
++    options->key = xstrdup("_source");
++    options->value = xstrdup("server/udev");
++    if (!options->key || !options->value)
++        goto unwind;
++
++    parent = udev_device_get_parent(udev_device);
++    if (parent) {
++        name = udev_device_get_sysattr_value(parent, "name");
++        if (!name)
++            name = udev_device_get_property_value(parent, "NAME");
++    }
++    if (!name)
++        name = "(unnamed)";
++    else
++        attrs.product = name;
++    add_option(&options, "name", name);
++
++    add_option(&options, "path", path);
++    add_option(&options, "device", path);
++    attrs.device = path;
++    attrs.tags = xstrtokenize(udev_device_get_property_value(udev_device, "ID_INPUT.tags"), ",");
++
++    config_info = Xprintf("udev:%s", syspath);
++    if (!config_info)
++        goto unwind;
++
++    if (device_is_duplicate(config_info)) {
++        LogMessage(X_WARNING, "config/udev: device %s already added. "
++                              "Ignoring.\n", name);
++        goto unwind;
++    }
++
++    set = udev_device_get_properties_list_entry(udev_device);
++    udev_list_entry_foreach(entry, set) {
++        key = udev_list_entry_get_name(entry);
++        if (!key)
++            continue;
++        value = udev_list_entry_get_value(entry);
++        if (!strncasecmp(key, UDEV_XKB_PROP_KEY,
++                                sizeof(UDEV_XKB_PROP_KEY) - 1)) {
++            tmp = key + sizeof(UDEV_XKB_PROP_KEY) - 1;
++            if (!strcasecmp(tmp, "rules"))
++                add_option(&options, "xkb_rules", value);
++            else if (!strcasecmp(tmp, "layout"))
++                add_option(&options, "xkb_layout", value);
++            else if (!strcasecmp(tmp, "variant"))
++                add_option(&options, "xkb_variant", value);
++            else if (!strcasecmp(tmp, "model"))
++                add_option(&options, "xkb_model", value);
++            else if (!strcasecmp(tmp, "options"))
++                add_option(&options, "xkb_options", value);
++        } else if (!strcmp(key, "ID_VENDOR")) {
++            attrs.vendor = value;
++        } else if (!strcmp(key, "ID_INPUT_KEY")) {
++            attrs.flags |= ATTR_KEYBOARD;
++        } else if (!strcmp(key, "ID_INPUT_MOUSE")) {
++            attrs.flags |= ATTR_POINTER;
++        } else if (!strcmp(key, "ID_INPUT_JOYSTICK")) {
++            attrs.flags |= ATTR_JOYSTICK;
++        } else if (!strcmp(key, "ID_INPUT_TABLET")) {
++            attrs.flags |= ATTR_TABLET;
++        } else if (!strcmp(key, "ID_INPUT_TOUCHPAD")) {
++            attrs.flags |= ATTR_TOUCHPAD;
++        } else if (!strcmp(key, "ID_INPUT_TOUCHSCREEN")) {
++            attrs.flags |= ATTR_TOUCHSCREEN;
++        }
++    }
++    LogMessage(X_INFO, "config/udev: Adding input device %s (%s)\n",
++               name, path);
++    rc = NewInputDeviceRequest(options, &attrs, &dev);
++    if (rc != Success)
++        goto unwind;
++
++    for (; dev; dev = dev->next) {
++        xfree(dev->config_info);
++        dev->config_info = xstrdup(config_info);
++    }
++
++ unwind:
++    xfree(config_info);
++    while (!dev && (tmpo = options)) {
++        options = tmpo->next;
++        xfree(tmpo->key);
++        xfree(tmpo->value);
++        xfree(tmpo);
++    }
++
++    if (attrs.tags) {
++        char **tag = attrs.tags;
++        while (*tag) {
++            xfree(*tag);
++            tag++;
++        }
++        xfree(attrs.tags);
++    }
++
++    return;
++}
++
++static void
++device_removed(struct udev_device *device)
++{
++    char *value;
++    const char *syspath = udev_device_get_syspath(device);
++
++    value = Xprintf("udev:%s", syspath);
++    if (!value)
++        return;
++
++    remove_devices("udev", value);
++
++    xfree(value);
++}
++
++static void
++wakeup_handler(pointer data, int err, pointer read_mask)
++{
++    int udev_fd = udev_monitor_get_fd(udev_monitor);
++    struct udev_device *udev_device;
++    const char *action;
++
++    if (err < 0)
++        return;
++
++    if (FD_ISSET(udev_fd, (fd_set *)read_mask)) {
++        udev_device = udev_monitor_receive_device(udev_monitor);
++        if (!udev_device)
++            return;
++        action = udev_device_get_action(udev_device);
++        if (action) {
++            if (!strcmp(action, "add"))
++                device_added(udev_device);
++            else if (!strcmp(action, "remove"))
++                device_removed(udev_device);
++        }
++        udev_device_unref(udev_device);
++    }
++}
++
++static void
++block_handler(pointer data, struct timeval **tv, pointer read_mask)
++{
++}
++
++int
++config_udev_init(void)
++{
++    struct udev *udev;
++    struct udev_enumerate *enumerate;
++    struct udev_list_entry *devices, *device;
++
++    udev = udev_new();
++    if (!udev)
++        return 0;
++    udev_monitor = udev_monitor_new_from_netlink(udev, "udev");
++    if (!udev_monitor)
++        return 0;
++
++    if (udev_monitor_enable_receiving(udev_monitor)) {
++        ErrorF("config/udev: failed to bind the udev monitor\n");
++        return 0;
++    }
++
++    enumerate = udev_enumerate_new(udev);
++    if (!enumerate)
++        return 0;
++    udev_enumerate_scan_devices(enumerate);
++    devices = udev_enumerate_get_list_entry(enumerate);
++    udev_list_entry_foreach(device, devices) {
++        const char *syspath = udev_list_entry_get_name(device);
++        struct udev_device *udev_device = udev_device_new_from_syspath(udev, syspath);
++        device_added(udev_device);
++        udev_device_unref(udev_device);
++    }
++    udev_enumerate_unref(enumerate);
++
++    RegisterBlockAndWakeupHandlers(block_handler, wakeup_handler, NULL);
++    AddGeneralSocket(udev_monitor_get_fd(udev_monitor));
++
++    return 1;
++}
++
++void
++config_udev_fini(void)
++{
++    struct udev *udev;
++
++    if (!udev_monitor)
++        return;
++
++    udev = udev_monitor_get_udev(udev_monitor);
++
++    RemoveGeneralSocket(udev_monitor_get_fd(udev_monitor));
++    RemoveBlockAndWakeupHandlers(block_handler, wakeup_handler, udev_monitor);
++    udev_monitor_unref(udev_monitor);
++    udev_monitor = NULL;
++    udev_unref(udev);
++}
+Index: xorg-server/configure.ac
+===================================================================
+--- xorg-server.orig/configure.ac
++++ xorg-server/configure.ac
+@@ -601,6 +601,7 @@ AC_ARG_ENABLE(multibuffer,    AS_HELP_ST
+ AC_ARG_ENABLE(dbe,            AS_HELP_STRING([--disable-dbe], [Build DBE extension (default: enabled)]), [DBE=$enableval], [DBE=yes])
+ AC_ARG_ENABLE(xf86bigfont,    AS_HELP_STRING([--disable-xf86bigfont], [Build XF86 Big Font extension (default: disabled)]), [XF86BIGFONT=$enableval], [XF86BIGFONT=no])
+ AC_ARG_ENABLE(dpms,           AS_HELP_STRING([--disable-dpms], [Build DPMS extension (default: enabled)]), [DPMSExtension=$enableval], [DPMSExtension=yes])
++AC_ARG_ENABLE(config-udev,    AS_HELP_STRING([--enable-config-udev], [Build udev support (default: no)]), [CONFIG_UDEV=$enableval], [CONFIG_UDEV=no])
+ AC_ARG_ENABLE(config-dbus,    AS_HELP_STRING([--enable-config-dbus], [Build D-BUS API support (default: no)]), [CONFIG_DBUS_API=$enableval], [CONFIG_DBUS_API=no])
+ AC_ARG_ENABLE(config-hal,     AS_HELP_STRING([--disable-config-hal], [Build HAL support (default: auto)]), [CONFIG_HAL=$enableval], [CONFIG_HAL=auto])
+ AC_ARG_ENABLE(xfree86-utils,     AS_HELP_STRING([--enable-xfree86-utils], [Build xfree86 DDX utilities (default: enabled)]), [XF86UTILS=$enableval], [XF86UTILS=yes])
+@@ -760,6 +761,26 @@ LIBXTST="xtst >= 1.0.99.2"
+ LIBPCIACCESS="pciaccess >= 0.8.0"
+ LIBGLIB="glib-2.0 >= 2.16"
+ LIBSELINUX="libselinux >= 2.0.86"
++LIBUDEV="libudev >= 143"
++
++if test "x$CONFIG_UDEV" = xyes &&
++ { test "x$CONFIG_DBUS_API" = xyes || test "x$CONFIG_HAL" = xyes; }; then
++       AC_MSG_ERROR([Hotplugging through both libudev and dbus/hal not allowed])
++fi
++
++PKG_CHECK_MODULES(UDEV, $LIBUDEV, [HAVE_LIBUDEV=yes], [HAVE_LIBUDEV=no])
++if test "x$CONFIG_UDEV" = xauto; then
++       CONFIG_UDEV="$HAVE_LIBUDEV"
++fi
++AM_CONDITIONAL(CONFIG_UDEV, [test "x$CONFIG_UDEV" = xyes])
++if test "x$CONFIG_UDEV" = xyes; then
++       CONFIG_DBUS_API=no
++       CONFIG_HAL=no
++       if ! test "x$HAVE_LIBUDEV" = xyes; then
++               AC_MSG_ERROR([udev configuration API requested, but libudev is not installed])
++       fi
++       AC_DEFINE(CONFIG_UDEV, 1, [Use libudev for input hotplug])
++fi
+ 
+ dnl HAVE_DBUS is true if we actually have the D-Bus library, whereas
+ dnl CONFIG_DBUS_API is true if we want to enable the D-Bus config
+@@ -793,13 +814,11 @@ if test "x$CONFIG_HAL" = xyes; then
+ 	fi
+ 
+ 	AC_DEFINE(CONFIG_HAL, 1, [Use the HAL hotplug API])
+-        REQUIRED_LIBS="$REQUIRED_LIBS hal"
+ 	CONFIG_NEED_DBUS="yes"
+ fi
+ AM_CONDITIONAL(CONFIG_HAL, [test "x$CONFIG_HAL" = xyes])
+ 
+ if test "x$CONFIG_NEED_DBUS" = xyes; then
+-	REQUIRED_LIBS="$REQUIRED_LIBS dbus-1"
+         AC_DEFINE(CONFIG_NEED_DBUS, 1, [Use D-Bus for input hotplug])
+ fi
+ AM_CONDITIONAL(CONFIG_NEED_DBUS, [test "x$CONFIG_NEED_DBUS" = xyes])
+Index: xorg-server/hw/kdrive/src/kinput.c
+===================================================================
+--- xorg-server.orig/hw/kdrive/src/kinput.c
++++ xorg-server/hw/kdrive/src/kinput.c
+@@ -2281,6 +2281,14 @@ NewInputDeviceRequest(InputOption *optio
+             return BadValue;
+         }
+ #endif
++#ifdef CONFIG_UDEV
++        else if (strcmp(option->key, "_source") == 0 &&
++                 strcmp(option->value, "server/udev") == 0)
++        {
++            ErrorF("Ignoring device from udev.\n");
++            return BadValue;
++        }
++#endif
+     }
+ 
+     if (!ki && !pi) {
+Index: xorg-server/hw/xfree86/common/xf86Config.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Config.c
++++ xorg-server/hw/xfree86/common/xf86Config.c
+@@ -1461,12 +1461,19 @@ checkCoreInputDevices(serverLayoutPtr se
+     }
+ 
+     if (xf86Info.allowEmptyInput && !(foundPointer && foundKeyboard)) {
+-#ifdef CONFIG_HAL
+-	xf86Msg(X_INFO, "The server relies on HAL to provide the list of "
++#if defined(CONFIG_HAL) || defined(CONFIG_UDEV)
++	const char *config_backend;
++#if defined(CONFIG_HAL)
++	config_backend = "HAL";
++#else
++	config_backend = "udev";
++#endif
++	xf86Msg(X_INFO, "The server relies on %s to provide the list of "
+ 	                "input devices.\n\tIf no devices become available, "
+-	                "reconfigure HAL or disable AutoAddDevices.\n");
++	                "reconfigure %s or disable AutoAddDevices.\n",
++			config_backend, config_backend);
+ #else
+-	xf86Msg(X_INFO, "HAL is disabled and no input devices were configured.\n"
++	xf86Msg(X_INFO, "Hotplugging is disabled and no input devices were configured.\n"
+ 			"\tTry disabling AllowEmptyInput.\n");
+ #endif
+     }
+Index: xorg-server/hw/xfree86/common/xf86Globals.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Globals.c
++++ xorg-server/hw/xfree86/common/xf86Globals.c
+@@ -132,7 +132,7 @@ xf86InfoRec xf86Info = {
+     .kbdCustomKeycodes          = FALSE,
+     .disableRandR               = FALSE,
+     .randRFrom                  = X_DEFAULT,
+-#ifdef CONFIG_HAL
++#if defined(CONFIG_HAL) || defined(CONFIG_UDEV)
+     .allowEmptyInput            = TRUE,
+     .autoAddDevices             = TRUE,
+     .autoEnableDevices          = TRUE
+Index: xorg-server/hw/xfree86/common/xf86Xinput.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Xinput.c
++++ xorg-server/hw/xfree86/common/xf86Xinput.c
+@@ -788,9 +788,9 @@ NewInputDeviceRequest (InputOption *opti
+             }
+         }
+ 
+-        /* Right now, the only automatic config we know of is HAL. */
+         if (strcmp(option->key, "_source") == 0 &&
+-            strcmp(option->value, "server/hal") == 0) {
++            (strcmp(option->value, "server/hal") == 0 ||
++             strcmp(option->value, "server/udev") == 0)) {
+             is_auto = 1;
+             if (!xf86Info.autoAddDevices) {
+                 rval = BadMatch;
+Index: xorg-server/include/dix-config.h.in
+===================================================================
+--- xorg-server.orig/include/dix-config.h.in
++++ xorg-server/include/dix-config.h.in
+@@ -393,6 +393,9 @@
+ /* Support D-Bus */
+ #undef HAVE_DBUS
+ 
++/* Use libudev for input hotplug */
++#undef CONFIG_UDEV
++
+ /* Use D-Bus for input hotplug */
+ #undef CONFIG_NEED_DBUS
+ 
+Index: xorg-server/dix/main.c
+===================================================================
+--- xorg-server.orig/dix/main.c
++++ xorg-server/dix/main.c
+@@ -166,7 +166,6 @@ int main(int argc, char *argv[], char *e
+ 	InitBlockAndWakeupHandlers();
+ 	/* Perform any operating system dependent initializations you'd like */
+ 	OsInit();
+-        config_init();
+ 	if(serverGeneration == 1)
+ 	{
+ 	    CreateWellKnownSockets();
+@@ -254,6 +253,7 @@ int main(int argc, char *argv[], char *e
+         InitCoreDevices();
+ 	InitInput(argc, argv);
+ 	InitAndStartDevices();
++        config_init();
+ 
+ 	dixSaveScreens(serverClient, SCREEN_SAVER_FORCER, ScreenSaverReset);
+ 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-003-xfree86-dont-complain-about-missing-coredevices.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-003-xfree86-dont-complain-about-missing-coredevices.patch
new file mode 100644
index 0000000..c1cfd65
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-003-xfree86-dont-complain-about-missing-coredevices.patch
@@ -0,0 +1,58 @@
+commit 116068103282924ef1476231d13d54719a797252
+Author: Peter Hutterer <peter.hutterer@who-t.net>
+Date:   Tue Mar 9 09:35:23 2010 +1000
+
+    xfree86: don't warn about nonexisting core pointer/keyboard in config.
+    
+    In the vast majority of cases there is no xorg.conf that specifies a core
+    pointer/keyboard. Skip this warning, since we'll get another notification
+    about how the server relies on the config backend for input devices anyway.
+    
+    Leave the warning in for the error case (AEI off).
+    
+    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+    Reviewed-by: Fernando Carrijo <fcarrijo@yahoo.com.br>
+    Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
+
+diff --git a/hw/xfree86/common/xf86Config.c b/hw/xfree86/common/xf86Config.c
+index 132e8bc..65725d2 100644
+--- a/hw/xfree86/common/xf86Config.c
++++ b/hw/xfree86/common/xf86Config.c
+@@ -1286,14 +1286,10 @@ checkCoreInputDevices(serverLayoutPtr servlayoutp, Bool implicitLayout)
+ 	}
+     }
+ 
+-    if (!foundPointer) {
+-	if (!xf86Info.allowEmptyInput) {
+-	    /* This shouldn't happen. */
+-	    xf86Msg(X_ERROR, "Cannot locate a core pointer device.\n");
+-	    return FALSE;
+-	} else {
+-	    xf86Msg(X_INFO, "Cannot locate a core pointer device.\n");
+-	}
++    if (!foundPointer && !xf86Info.allowEmptyInput) {
++	/* This shouldn't happen. */
++	xf86Msg(X_ERROR, "Cannot locate a core pointer device.\n");
++	return FALSE;
+     }
+ 
+     /*
+@@ -1430,14 +1426,10 @@ checkCoreInputDevices(serverLayoutPtr servlayoutp, Bool implicitLayout)
+ 	}
+     }
+ 
+-    if (!foundKeyboard) {
+-	if (!xf86Info.allowEmptyInput) {
+-		/* This shouldn't happen. */
+-		xf86Msg(X_ERROR, "Cannot locate a core keyboard device.\n");
+-		return FALSE;
+-	} else {
+-		xf86Msg(X_INFO, "Cannot locate a core keyboard device.\n");
+-	}
++    if (!foundKeyboard && !xf86Info.allowEmptyInput) {
++	/* This shouldn't happen. */
++	xf86Msg(X_ERROR, "Cannot locate a core keyboard device.\n");
++	return FALSE;
+     }
+ 
+     if (pointerMsg) {
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-004-unbreak-input-abi.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-004-unbreak-input-abi.patch
new file mode 100644
index 0000000..c0a08a7
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-004-unbreak-input-abi.patch
@@ -0,0 +1,148 @@
+Index: xorg-server/Xi/stubs.c
+===================================================================
+--- xorg-server.orig/Xi/stubs.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/Xi/stubs.c	2010-03-30 13:57:21.000000000 +0300
+@@ -227,7 +227,13 @@
+  *
+  */
+ int
+-NewInputDeviceRequest(InputOption *options, InputAttributes *attrs,
++NewInputDeviceRequest(InputOption *options, DeviceIntPtr *pdev)
++{
++    return BadValue;
++}
++
++int
++NewInputDeviceRequest18(InputOption *options, InputAttributes *attrs,
+                       DeviceIntPtr *pdev)
+ {
+     return BadValue;
+Index: xorg-server/config/dbus.c
+===================================================================
+--- xorg-server.orig/config/dbus.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/config/dbus.c	2010-03-30 13:57:21.000000000 +0300
+@@ -147,7 +147,7 @@
+         dbus_message_iter_next(&iter);
+     }
+ 
+-    ret = NewInputDeviceRequest(options, NULL, &dev);
++    ret = NewInputDeviceRequest18(options, NULL, &dev);
+     if (ret != Success) {
+         DebugF("[config/dbus] NewInputDeviceRequest failed\n");
+         goto unwind;
+Index: xorg-server/config/hal.c
+===================================================================
+--- xorg-server.orig/config/hal.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/config/hal.c	2010-03-30 13:57:21.000000000 +0300
+@@ -359,7 +359,7 @@
+ 
+     /* this isn't an error, but how else do you output something that the user can see? */
+     LogMessage(X_INFO, "config/hal: Adding input device %s\n", name);
+-    if ((rc = NewInputDeviceRequest(options, &attrs, &dev)) != Success) {
++    if ((rc = NewInputDeviceRequest18(options, &attrs, &dev)) != Success) {
+         LogMessage(X_ERROR, "config/hal: NewInputDeviceRequest failed (%d)\n", rc);
+         dev = NULL;
+         goto unwind;
+Index: xorg-server/config/udev.c
+===================================================================
+--- xorg-server.orig/config/udev.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/config/udev.c	2010-03-30 13:57:21.000000000 +0300
+@@ -136,7 +136,7 @@
+     }
+     LogMessage(X_INFO, "config/udev: Adding input device %s (%s)\n",
+                name, path);
+-    rc = NewInputDeviceRequest(options, &attrs, &dev);
++    rc = NewInputDeviceRequest18(options, &attrs, &dev);
+     if (rc != Success)
+         goto unwind;
+ 
+Index: xorg-server/hw/dmx/dmxinput.c
+===================================================================
+--- xorg-server.orig/hw/dmx/dmxinput.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/hw/dmx/dmxinput.c	2010-03-30 13:57:21.000000000 +0300
+@@ -103,7 +103,13 @@
+ }
+ 
+ int
+-NewInputDeviceRequest (InputOption *options, InputAttributes *attrs,
++NewInputDeviceRequest (InputOption *options, DeviceIntPtr *pdev)
++{
++    return BadRequest;
++}
++
++int
++NewInputDeviceRequest18 (InputOption *options, InputAttributes *attrs,
+                        DeviceIntPtr *pdev)
+ {
+     return BadRequest;
+Index: xorg-server/hw/kdrive/src/kinput.c
+===================================================================
+--- xorg-server.orig/hw/kdrive/src/kinput.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/hw/kdrive/src/kinput.c	2010-03-30 13:57:21.000000000 +0300
+@@ -2249,7 +2249,12 @@
+ }
+ 
+ int
+-NewInputDeviceRequest(InputOption *options, InputAttributes *attrs,
++NewInputDeviceRequest(InputOption *options, DeviceIntPtr *pdev)
++{
++    return NewInputDeviceRequest18(options, NULL, pdev);
++}
++int
++NewInputDeviceRequest18(InputOption *options, InputAttributes *attrs,
+                       DeviceIntPtr *pdev)
+ {
+     InputOption *option = NULL;
+Index: xorg-server/hw/xfree86/common/xf86Xinput.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Xinput.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/hw/xfree86/common/xf86Xinput.c	2010-03-30 13:57:32.000000000 +0300
+@@ -750,7 +750,13 @@
+ }
+ 
+ int
+-NewInputDeviceRequest (InputOption *options, InputAttributes *attrs,
++NewInputDeviceRequest (InputOption *options, DeviceIntPtr *pdev)
++{
++    return NewInputDeviceRequest18(options, NULL, pdev);
++}
++
++int
++NewInputDeviceRequest18 (InputOption *options, InputAttributes *attrs,
+                        DeviceIntPtr *pdev)
+ {
+     IDevRec *idev = NULL;
+Index: xorg-server/hw/xquartz/darwinXinput.c
+===================================================================
+--- xorg-server.orig/hw/xquartz/darwinXinput.c	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/hw/xquartz/darwinXinput.c	2010-03-30 13:57:21.000000000 +0300
+@@ -230,7 +230,14 @@
+  *
+  */
+ int
+-NewInputDeviceRequest(InputOption *options, InputAttributes *attrs,
++NewInputDeviceRequest(InputOption *options, DeviceIntPtr *pdev)
++{
++  DEBUG_LOG("NewInputDeviceRequest(%p, %p)\n", options, pdev);
++  return BadValue;
++}
++
++int
++NewInputDeviceRequest18(InputOption *options, InputAttributes *attrs,
+                       DeviceIntPtr *pdev)
+ {
+   DEBUG_LOG("NewInputDeviceRequest(%p, %p)\n", options, pdev);
+Index: xorg-server/include/input.h
+===================================================================
+--- xorg-server.orig/include/input.h	2010-03-30 13:57:21.000000000 +0300
++++ xorg-server/include/input.h	2010-03-30 13:57:21.000000000 +0300
+@@ -530,6 +530,9 @@
+ /* Implemented by the DDX. */
+ extern _X_EXPORT int NewInputDeviceRequest(
+     InputOption *options,
++    DeviceIntPtr *dev);
++extern int NewInputDeviceRequest18(
++    InputOption *options,
+     InputAttributes *attrs,
+     DeviceIntPtr *dev);
+ extern  _X_EXPORT void DeleteInputDeviceRequest(
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-005-xfree86-saner-conf-search-paths.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-005-xfree86-saner-conf-search-paths.patch
new file mode 100644
index 0000000..0afe626
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-005-xfree86-saner-conf-search-paths.patch
@@ -0,0 +1,232 @@
+Merged patches:
+
+7962c8f78964d460c76f76dda2795b971a8c2a94
+eb07b8606f9a1349baf8114bb36dc2712e5d3419
+a4516965de447332794ee0afb9503c351fff6fe8
+59f96734633fce3c2bee62bce860aed33033ce3e
+0c4a358eae0e77f389380bbbf39d4419f2dd6dcd
+
+Index: xorg-server/hw/xfree86/parser/Makefile.am
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/Makefile.am
++++ xorg-server/hw/xfree86/parser/Makefile.am
+@@ -34,7 +34,9 @@
+ 	$(INTERNAL_SOURCES)
+ libxf86config_a_CFLAGS = $(AM_CFLAGS)
+ 
+-AM_CFLAGS = $(DIX_CFLAGS) $(XORG_CFLAGS)
++AM_CFLAGS = $(DIX_CFLAGS) $(XORG_CFLAGS) \
++	-DSYSCONFDIR=\"$(sysconfdir)\" \
++	-DDATADIR=\"$(datadir)\"
+ 
+ EXTRA_DIST = \
+ 	Configint.h \
+Index: xorg-server/hw/xfree86/parser/scan.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/parser/scan.c
++++ xorg-server/hw/xfree86/parser/scan.c
+@@ -599,6 +599,8 @@
+  *    %F    config file environment ($XORGCONFIG) as a relative path
+  *    %G    config file environment ($XORGCONFIG) as a safe path
+  *    %P    projroot
++ *    %C    sysconfdir
++ *    %D    datadir
+  *    %M    major version number
+  *    %%    %
+  */
+@@ -615,6 +617,12 @@
+ #ifndef PROJECTROOT
+ #define PROJECTROOT	"/usr/X11R6"
+ #endif
++#ifndef SYSCONFDIR
++#define SYSCONFDIR	PROJECTROOT "/etc"
++#endif
++#ifndef DATADIR
++#define DATADIR		PROJECTROOT "/share"
++#endif
+ #ifndef XCONFENV
+ #define XCONFENV	"XORGCONFIG"
+ #endif
+@@ -755,6 +763,12 @@
+ 				else
+ 					BAIL_OUT;
+ 				break;
++			case 'C':
++				APPEND_STR(SYSCONFDIR);
++				break;
++			case 'D':
++				APPEND_STR(DATADIR);
++				break;
+ 			case 'M':
+ 				if (!majorvers[0]) {
+ 					if (XF86_VERSION_MAJOR < 0 || XF86_VERSION_MAJOR > 99) {
+Index: xorg-server/hw/xfree86/doc/man/xorg.conf.man.pre
+===================================================================
+--- xorg-server.orig/hw/xfree86/doc/man/xorg.conf.man.pre
++++ xorg-server/hw/xfree86/doc/man/xorg.conf.man.pre
+@@ -102,19 +102,51 @@
+ .BR gethostname (__libmansuffix__).
+ .PP
+ Additional configuration files are searched for in the following
+-directories:
++directories when the server is started as a normal user:
+ .PP
+ .RS 4
+ .nf
+-.I /etc/X11/__xconfigdir__\-4
++.IR /etc/X11/ <cmdline>
++.IR __sysconfdir__/X11/ <cmdline>
+ .I /etc/X11/__xconfigdir__
+-.I /etc/__xconfigdir__
+-.IR __projectroot__/etc/X11/__xconfigdir__. <hostname>
+-.I __projectroot__/etc/X11/__xconfigdir__\-4
+-.I __projectroot__/etc/X11/__xconfigdir__
+-.IR __projectroot__/lib/X11/__xconfigdir__. <hostname>
+-.I __projectroot__/lib/X11/__xconfigdir__\-4
+-.I __projectroot__/lib/X11/__xconfigdir__
++.I __sysconfdir__/X11/__xconfigdir__
++.fi
++.RE
++.PP
++where
++.I <cmdline>
++is a relative path (with no \(lq..\(rq components) specified with the
++.B \-configdir
++command line option.
++.PP
++When the __xservername__ server is started by the \(lqroot\(rq user, the
++config directory search locations are as follows:
++.PP
++.RS 4
++.nf
++<cmdline>
++.IR /etc/X11/ <cmdline>
++.IR __sysconfdir__/X11/ <cmdline>
++.I /etc/X11/__xconfigdir__
++.I __sysconfdir__/X11/__xconfigdir__
++.fi
++.RE
++.PP
++where
++.I <cmdline>
++is the path specified with the
++.B \-configdir
++command line option (which may be absolute or relative).
++.PP
++Finally, configuration files will also be searched for in directories
++reserved for system use. These are to separate configuration files from
++the vendor or 3rd party packages from those of local administration.
++These files are found in the following directories:
++.PP
++.RS 4
++.nf
++.I /usr/share/X11/__xconfigdir__
++.I __datadir__/X11/__xconfigdir__
+ .fi
+ .RE
+ .PP
+Index: xorg-server/configure.ac
+===================================================================
+--- xorg-server.orig/configure.ac
++++ xorg-server/configure.ac
+@@ -1744,8 +1744,10 @@
+ 	AC_SUBST([driverdir])
+ 	sdkdir="$includedir/xorg"
+ 	extdir="$includedir/X11/extensions"
++	sysconfigdir="$datadir/X11/$XF86CONFIGDIR"
+ 	AC_SUBST([sdkdir])
+ 	AC_SUBST([extdir])
++	AC_SUBST([sysconfigdir])
+ 	AC_SUBST([logdir])
+ 
+ 	# stuff the ABI versions into the pc file too
+Index: xorg-server/hw/xfree86/common/xf86Config.c
+===================================================================
+--- xorg-server.orig/hw/xfree86/common/xf86Config.c
++++ xorg-server/hw/xfree86/common/xf86Config.c
+@@ -97,20 +97,15 @@
+ #endif
+ #ifndef ROOT_CONFIGDIRPATH
+ #define ROOT_CONFIGDIRPATH	"%A," "%R," \
+-				"/etc/X11/%R," "%P/etc/X11/%R," \
+-				"/etc/X11/%X-%M," "/etc/X11/%X," "/etc/%X," \
+-				"%P/etc/X11/%X.%H," "%P/etc/X11/%X-%M," \
+-				"%P/etc/X11/%X," \
+-				"%P/lib/X11/%X.%H," "%P/lib/X11/%X-%M," \
+-				"%P/lib/X11/%X"
++				"/etc/X11/%R," "%C/X11/%R," \
++				"/etc/X11/%X," "%C/X11/%X"
+ #endif
+ #ifndef USER_CONFIGDIRPATH
+-#define USER_CONFIGDIRPATH	"/etc/X11/%S," "%P/etc/X11/%S," \
+-				"/etc/X11/%X-%M," "/etc/X11/%X," "/etc/%X," \
+-				"%P/etc/X11/%X.%H," "%P/etc/X11/%X-%M," \
+-				"%P/etc/X11/%X," \
+-				"%P/lib/X11/%X.%H," "%P/lib/X11/%X-%M," \
+-				"%P/lib/X11/%X"
++#define USER_CONFIGDIRPATH	"/etc/X11/%R," "%C/X11/%R," \
++				"/etc/X11/%X," "%C/X11/%X"
++#endif
++#ifndef SYS_CONFIGDIRPATH
++#define SYS_CONFIGDIRPATH	"/usr/share/X11/%X," "%D/X11/%X"
+ #endif
+ #ifndef PROJECTROOT
+ #define PROJECTROOT	"/usr/X11R6"
+@@ -2468,7 +2463,7 @@
+ ConfigStatus
+ xf86HandleConfigFile(Bool autoconfig)
+ {
+-    const char *filename, *dirname;
++    const char *filename, *dirname, *sysdirname;
+     char *filesearch, *dirsearch;
+     MessageType filefrom = X_DEFAULT;
+     MessageType dirfrom = X_DEFAULT;
+@@ -2491,6 +2486,8 @@
+ 	    dirfrom = X_CMDLINE;
+ 
+ 	xf86initConfigFiles();
++	sysdirname = xf86openConfigDirFiles(SYS_CONFIGDIRPATH, NULL,
++					    PROJECTROOT);
+ 	dirname = xf86openConfigDirFiles(dirsearch, xf86ConfigDir, PROJECTROOT);
+ 	filename = xf86openConfigFile(filesearch, xf86ConfigFile, PROJECTROOT);
+ 	if (filename) {
+@@ -2511,7 +2508,10 @@
+ 			"Unable to locate/open config directory: \"%s\"\n",
+ 			xf86ConfigDir);
+ 	}
+-	if (!filename && !dirname)
++	if (sysdirname)
++	    xf86MsgVerb(X_DEFAULT, 0, "Using system config directory \"%s\"\n",
++			sysdirname);
++	if (!filename && !dirname && !sysdirname)
+ 	    return CONFIG_NOFILE;
+     }
+ 
+Index: xorg-server/xorg-server.pc.in
+===================================================================
+--- xorg-server.orig/xorg-server.pc.in
++++ xorg-server/xorg-server.pc.in
+@@ -2,8 +2,10 @@
+ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+ includedir=@includedir@
++datarootdir=@datarootdir@
+ moduledir=@moduledir@
+ sdkdir=@sdkdir@
++sysconfigdir=@sysconfigdir@
+ 
+ abi_ansic=@abi_ansic@
+ abi_videodrv=@abi_videodrv@
+Index: xorg-server/cpprules.in
+===================================================================
+--- xorg-server.orig/cpprules.in
++++ xorg-server/cpprules.in
+@@ -36,6 +36,8 @@
+ 	-D__adminmansuffix__=$(ADMIN_MAN_SUFFIX) \
+ 	-D__mandir__=$(mandir) \
+ 	-D__projectroot__=$(prefix) \
++	-D__sysconfdir__=$(sysconfdir) \
++	-D__datadir__=$(datadir) \
+ 	-D__xconfigfile__=$(__XCONFIGFILE__) \
+ 	-D__xconfigdir__=$(__XCONFIGDIR__) \
+ 	-D__xkbdir__=$(XKB_BASE_DIRECTORY) \
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-006-Add-10-evdev.conf.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-006-Add-10-evdev.conf.patch
new file mode 100644
index 0000000..d2a5cb5
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-006-Add-10-evdev.conf.patch
@@ -0,0 +1,97 @@
+From 6d0f5735216847a9b8ea96b874bd68bc97992e4f Mon Sep 17 00:00:00 2001
+From: Julien Cristau <jcristau@debian.org>
+Date: Fri, 16 Apr 2010 21:34:33 +0200
+Subject: [PATCH] Add 10-evdev.conf
+
+Cherry-picked from upstream commits:
+24952b7 Install 10-evdev.conf in $(prefix)/etc/X11/xorg.conf.d under udev
+c8a608c config: only match sane devices in 10-evdev.conf
+d4dd3d0 Move 10-evdev.conf to system config dir $datadir/X11/xorg.conf.d
+---
+ config/10-evdev.conf |   40 ++++++++++++++++++++++++++++++++++++++++
+ config/Makefile.am   |    5 ++++-
+ configure.ac         |    1 +
+ 3 files changed, 45 insertions(+), 1 deletions(-)
+ create mode 100644 config/10-evdev.conf
+
+diff --git a/config/10-evdev.conf b/config/10-evdev.conf
+new file mode 100644
+index 0000000..cc83ab2
+--- /dev/null
++++ b/config/10-evdev.conf
+@@ -0,0 +1,40 @@
++#
++# Catch-all evdev loader for udev-based systems
++# We don't simply match on any device since that also adds accelerometers
++# and other devices that we don't really want to use. The list below
++# matches everything but joysticks.
++
++Section "InputClass"
++        Identifier "evdev pointer catchall"
++        MatchIsPointer "on"
++        MatchDevicePath "/dev/input/event*"
++        Driver "evdev"
++EndSection
++
++Section "InputClass"
++        Identifier "evdev keyboard catchall"
++        MatchIsKeyboard "on"
++        MatchDevicePath "/dev/input/event*"
++        Driver "evdev"
++EndSection
++
++Section "InputClass"
++        Identifier "evdev touchpad catchall"
++        MatchIsTouchpad "on"
++        MatchDevicePath "/dev/input/event*"
++        Driver "evdev"
++EndSection
++
++Section "InputClass"
++        Identifier "evdev tablet catchall"
++        MatchIsTablet "on"
++        MatchDevicePath "/dev/input/event*"
++        Driver "evdev"
++EndSection
++
++Section "InputClass"
++        Identifier "evdev touchscreen catchall"
++        MatchIsTouchscreen "on"
++        MatchDevicePath "/dev/input/event*"
++        Driver "evdev"
++EndSection
+diff --git a/config/Makefile.am b/config/Makefile.am
+index 27f251b..675a3b2 100644
+--- a/config/Makefile.am
++++ b/config/Makefile.am
+@@ -9,6 +9,9 @@ AM_CFLAGS += $(UDEV_CFLAGS)
+ libconfig_la_SOURCES += udev.c
+ libconfig_la_LIBADD = $(UDEV_LIBS)
+ 
++xorgconfddir = $(datadir)/X11/$(XF86CONFIGDIR)
++xorgconfd_DATA = 10-evdev.conf
++
+ else
+ 
+ if CONFIG_NEED_DBUS
+@@ -33,4 +36,4 @@ endif # CONFIG_NEED_DBUS
+ 
+ endif # !CONFIG_UDEV
+ 
+-EXTRA_DIST = xorg-server.conf x11-input.fdi
++EXTRA_DIST = xorg-server.conf x11-input.fdi 10-evdev.conf
+diff --git a/configure.ac b/configure.ac
+index 574d9f0..9a10d8b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1717,6 +1717,7 @@ if test "x$XORG" = xyes; then
+ 	dnl these only go in xorg-config.h
+ 	XF86CONFIGFILE="xorg.conf"
+ 	XF86CONFIGDIR="xorg.conf.d"
++	AC_SUBST(XF86CONFIGDIR)
+ 	CONFIGFILE="$sysconfdir/$XF86CONFIGFILE"
+ 	LOGPREFIX="$logdir/Xorg."
+ 	AC_DEFINE(XORG_SERVER, 1, [Building Xorg server])
+-- 
+1.7.0.4
+
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 29f7c81..d19d330 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.7.5
+XSERVER_XORG_SERVER_VERSION = 1.7.7
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
+XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
@@ -105,6 +106,11 @@ XSERVER_XORG_SERVER_DEPENDENCIES += tslib
 XSERVER_XORG_SERVER_CONF_OPT += --enable-tslib LDFLAGS="-lts"
 endif
 
+ifeq ($(BR2_PACKAGE_UDEV),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += udev
+XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus
-- 
1.7.2.5
