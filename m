From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 17:27:38 +0200
Subject: [Buildroot] [PATCH] br2-external support existing package
 customization
In-Reply-To: <1445697514.888985483@f373.i.mail.ru>
References: <1445617505-16026-1-git-send-email-sv99@inbox.ru>
 <20151023224115.GD3674@free.fr>
 <1445697514.888985483@f373.i.mail.ru>
Message-ID: <20151024152738.GB3632@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-10-24 17:38 +0300, ?????? ???????? spake thusly:
> This my first patch sended throu git send-mail. Excuse me my wary bad
> english.

No problem! ;-)  Not everyone is a native english speaker, don't worry.

But please:
  - do not post HTML mail;
  - wrap your lines to ~72 chars.

> I have customized clone old version buildroot.

Then you should probably update to the latest version.

> Two packet have changed CONF_OPTS.
> 
> This solution for simple customization evailable packages. Add or
> remove single CONF params.

I understand that your solution matches your need to add additional
module support in nginx.

But even though your use-case is mostly harmless, providing this
feature would open too many possibilities to break the build in
non-trivial ways, which will be hard to debug (know that we the
Buildroot community tries to provide support for users and help them
when something fails, and this feature would be too problematic to
support).

> Include not worked in the eval environment,  after $(eval $(generic-package))
> in the make. Code in the included make will executed after eval fully
> executed - for customization purposes needs run code in the first lines
> generic-package macro!!

I made it to work with a very slight change to what I already posted,
see:

diff --git a/Config.in b/Config.in
index d795361..90bb1df 100644
--- a/Config.in
+++ b/Config.in
@@ -2,6 +2,9 @@
 
 mainmenu "Buildroot $BR2_VERSION Configuration"
 
+config BR2_OVERLAY_DIR
+    string "overlay dir"
+
 config BR2_HAVE_DOT_CONFIG
 	bool
 	default y
diff --git a/Makefile b/Makefile
index 853d185..c0c700c 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,8 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
+BR_OVERLAY_DIR := $(call qstrip,$(BR2_OVERLAY_DIR))
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffef4d3..6b29879 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -341,6 +341,10 @@ endef
 
 define inner-generic-package
 
+ifneq ($$(BR_OVERLAY_DIR),)
+-include $$(BR_OVERLAY_DIR)/$(1)/$(1).mk
+endif
+
 # Define default values for various package-related variables, if not
 # already defined. For some variables (version, source, site and
 # subdir), if they are undefined, we try to see if a variable without

See, the trick was to un-quote $(BR2_OVERLAY_DIR) with the 'qstrip'
function. And then to use $$ to dereference the BR_OVERLAY_DIR variable,
since it is in an inner macro.

> Version with git clone rtmp worked in old version and not changed, I
> simple tested working for this code.

The problem is not that it worked in an old version of Buildroot, but as
time passes, the rtmp module source tree will change, and the next time
you want to rebuild your project, then you will not get the same source
code for the rtmp module, since you clone the repository and use the
latest commit from the master branch.

Hence, the build is not reproducible.

> You version with NGINX_POST_EXTRACT_HOOKS looked wery well.

I believe it is working (but it may need a few tweaks), and so completely
removes the need for your overlay proposal. Just put that ion your
BR2_EXTERNAL tree, and you should be set.

But better yet: send a patch so we can have that support directly in
Buildroot and you will not need to patch Buildroot.

> In current version buildroot not allowed overload or tuning existing
> packages without patching original tree.

No, that's indeed not supported. And as I said previosuly, I am not sure
we would want to support that, even with my proposal above which is in
my humble opinion much cleaner than your convoluted eval+call+perl
solution.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
