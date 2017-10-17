From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 09:11:52 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171016211842.GA32198@bifrost>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
Message-ID: <20171017091152.67d7ad28@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Oct 2017 23:18:42 +0200, Anisse Astier wrote:

> > Are you sure this is working for multi-line hooks ? I think hooks
> > suffer from the same problem as commands.  
> 
> No, it's not working for multi-line hooks, I forgot about it. But we
> could use the helper for this as well.

Sure, OK.

> > Why do variables need to be exported? Isn't their value passed as
> > argument to the recipe-forward-log script ?
> 
> When simply using the multi-line make variable, it gets replaced in the
> recipe, and the shell command only receives the first line, even if we
> enclose the variable in double quotes. Exporting it to the environment
> made it possible to go through the make -> shell barrier.

But then there is no point in passing the commands as argument on the
wrapper command line, no? It could just use the variable from the
environment, no?

Does something like:

	COMMANDS="$($(PKG)_BUILD_CMDS)" ./support/script/your-wrapper

works ?

> Then I had to use the eval trick because otherwise the nested/computed
> $(PKG)_EXTRACT_CMDS variable would only be interpreted once, at initial
> parsing and not for each packages.

Adding Arnout in Cc on this topic, because he understands all this
make/shell sorcery :)

> > How many packages have you tested with this? I'm just a little bit
> > concerned with this parsing, and how it could break with arbitrary (but
> > valid) make commands.  
> 
> Not many. I have only tested the qemu_aarch64_virt_defconfig which does
> not contain much(~28 packages), but I was already able to fix a few
> parsing issues.

A bigger test is indeed needed to validate things. But let's see what
others have to say first.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
