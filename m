From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Jan 2019 17:59:49 +0100
Subject: [Buildroot] Linux extension from a BR2_EXTERNAL tree
In-Reply-To: <20190128172511.754500e4@windsurf>
References: <20190128172511.754500e4@windsurf>
Message-ID: <9e371258-7b3f-447a-7a65-7e3b2d6e4298@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/01/2019 17:25, Thomas Petazzoni wrote:
> So it seems like adding an entry to the LINUX_EXTENSIONS variable
> *after* linux/linux.mk has been processed works fine for the hook
> registration, but not for the dependency addition. This looks odd to
> me. The generic-package infrastructure does seem to have all the
> necessary double-dollars to make sure the evaluation is delayed to the
> time of use, but it seems to not be sufficient.
> 
> I am missing something obvious here ? I am not sure if I'm seeing
> something that's easily fixable, or something that is just plain
> impossible due to how make works.

 Yes you're missing something obvious :-)

 inner-generic-package has:

$(1)-depends:           $$($(2)_FINAL_DEPENDENCIES)

 At the time of

$(eval $(generic-package))

in linux.mk, this gets evaluated into

linux-depends:	$(LINUX_FINAL_DEPENDENCIES)

 For dependencies, however, the variable expansion is done then and there. So
with or without $$, this gets immediately expanded into

linux-depends:	<value-of-LINUX_FINAL_DEPENDENCIES-at-the-end-of-linux.mk>

 At that point, linux/linux-ext-*.mk has already been included, so in-tree linux
extensions are fine. However, BR2_EXTERNAL has not yet been included, so that
doesn't work...


 A possible solution that I've been thinking of for quite some time, is to delay
the expansion of inner-generic-package. In fact, it would have to be split into
a generic-package-definitions section, that defines all the rules and
dependencies and so on, and the actual inner-generic-package that just adds the
package name to the list of defined packages. Then, in a second run, we can
expand generic-package-definitions for all defined packages.

 Doing this would e.g. make it possibly to reliable refer to some other
package's _VERSION.

 It might also be useful to reduce empty 'make' time, by limiting the expansion
to only packages that are defined in PACKAGES (and host packages, as long as we
don't have complete Config.in.host).

 The potential breakage is obviously huge :-)


 Regards,
 Arnout
