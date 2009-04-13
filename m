From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 13 Apr 2009 16:26:23 -0300
Subject: [Buildroot] can package source be svn?
In-Reply-To: <20090413185232.B76731C8068@whitealder.osuosl.org>
References: <20090413185232.B76731C8068@whitealder.osuosl.org>
Message-ID: <d6cda7730904131226i29a7a5f0i30f67ad506ae43ff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Mon, Apr 13, 2009 at 3:44 PM, Chris Bare <chris@bareflix.com> wrote:
> I thought I saw that buildroot could get the package source files via svn, but
> now I can't find an example of a .mk file that implements this.
> Does this work, and can anyone point me to an example?

Sure, it's a bunch of makefiles, you could run any program or command.

For example, I have a custom "config" package in my tree that updates
some init scripts, snippet can be seen below.

Other than that rule for unpacking the sources, all the rest of the
makefile is quite standard.
I do realize there is an SVN variable somewhere, but I was too lazy to
look it up, it was easier for me to call svn directly. The variable
will just expand to "svn co" anyway.

#############################################################
#
# My Company config scripts
#
#############################################################
CONFIG_VERSION:=
CONFIG_SOURCE:=#My SVN URL, removed for privacy.
CONFIG_DIR:=$(BUILD_DIR)/config$(CONFIG_VERSION)
CONFIG_BINARY:=network
CONFIG_TARGET_BINARY:=/etc/init.d/network


$(CONFIG_DIR)/.unpacked:
        svn co $(CONFIG_SOURCE) --username $(MYCOMPANY_SVN_USER)
--password $(MYCOMPANY_SVN_PASSWD) $(CONFIG_DIR)
        touch $@
