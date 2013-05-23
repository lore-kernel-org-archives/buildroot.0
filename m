From: john <john.osullivan@cloudiumsystems.com>
Date: Thu, 23 May 2013 13:26:33 +0100
Subject: [Buildroot] Environment Variable and mk package file
Message-ID: <1369311993.2814.44.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a cmake based project which I am trying to incorporate into
buildroot-2012.05

As part of the configuration of the code I need to pass it an
environment variable $(CLIENT_VER) which I generate at the time of
building in the source directory (which I check out of SVN).
I have tried various approaches without success.

This is my mk file
#I first tried this approach by generating the cmake configuration
#command with a script and then executing that script
#but the problem here was I would need to know the location of the
#buildroot generated version of cmake and the toolchain file
#I could figure these out in the script but I felt there must be a
#simpler approach
#define CLIENT_BARROW_CONFIGURE_CMDS
#       (cd $(CLIENT_BARROW_SRCDIR) && source set_environment.sh \
#       && ./cmake_run \
#       )
#endef


#then I tried this
define CLIENT_BARROW_SET_ENVIRONMENT
        (source $(CLIENT_BARROW_SRCDIR)set_environment.sh  \
        && echo "Running Pre Configure Hook "  \
        )
endef
CLIENT_BARROW_PRE_CONFIGURE_HOOKS = CLIENT_BARROW_SET_ENVIRONMENT

CLIENT_BARROW_VERSION = HEAD
CLIENT_BARROW_SITE = svn://cloudiumserver3/topaz/trunk/client_barrow
CLIENT_BARROW_INSTALL_STAGING = YES
CLIENT_BARROW_CONF_OPT = -DWITH_XV=OFF -DCLIENT_VER_STR=$(CLIENT_VER) 
$(eval $(call CMAKETARGETS))

But I do not pick up the string associated with $(CLIENT_VER)


My basic question is this:
Is there someway to pickup an environment variable in the process that
processes the .mk file?
