From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Dec 2013 18:27:22 +0100
Subject: [Buildroot] [PATCH v10 7/8] package: enable jobserver for
	recursive make
In-Reply-To: <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52B32C7A.1010008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/12/13 11:36, Fabio Porcedda wrote:
> Add '+' prefix to the $($(PKG)_BUILD_CMDS) and $($(PKG)_INSTALL*_CMDS)
> commands to enable jobserver for the sub-make.
>
> Without the '+' prefix GNU make does not detect the sub-make so it
> disable the jobserver for the sub-make.

  $(PKG)_BUILD_CMDS is a multiline define, and the recursive make call 
may not be the first command. Can you check if this still works if the 
build commands are something like:

define FOO_BUILD_CMDS
	echo "Hello world!"
	$(MAKE) -C $(@D)
endef


  Regards,
  Arnout

>
> From GNU make documentation:
> Using the MAKE variable has the same effect as using a ?+? character
> at the beginning of the recipe line.  This special feature is only
> enabled if the MAKE variable appears directly in the recipe: it does
> not apply if the MAKE variable is referenced through expansion of
> another variable. In the latter case you must use the ?+? token to get
> these special effects.
>
> Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
