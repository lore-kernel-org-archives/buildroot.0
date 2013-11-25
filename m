From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Nov 2013 23:45:48 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <5293CEC8.9010601@mind.be>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
 <52931907.2040207@mind.be> <20131125190551.GA3435@free.fr>
 <5293CEC8.9010601@mind.be>
Message-ID: <20131125224548.GB3435@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-11-25 23:27 +0100, Arnout Vandecappelle spake thusly:
> On 25/11/13 20:05, Yann E. MORIN wrote:
> >Arnout,
> >
> >On 2013-11-25 10:31 +0100, Arnout Vandecappelle spake thusly:
> >>  This patch is obviously too large to be reviewed in a single shot, so here
> >>are some detailed comments on certain parts of it.
> >
> >Yes, I did expect it to be not trivial. Thank you for trying! :-)
> >
> >>  I don't think there's a way to split the patch up to make review easier,
> >>unfortunately. But anyway, the functionality is completely isolated from the
> >>rest so it doesn't hurt to commit it as is and fix up later if necessary.
> >
> >Maybe I could have separated the doc changes from the actual
> >implementation, to make it easier to review, and eventuall squash
> >both in a single cset for the final suvmission.
> 
>  I don't think separating the documentation would make review any easier.
> 
>  Something that _would_ make the review easier is to start with a simpler,
> less-featured version. But splitting it now is pretty much impossible.

Yes, too late, the script pre-existed the push by a few months now, and
splitting would be horrible on my side... :-(

> >>>diff --git a/fs/custom/Config.in b/fs/custom/Config.in
> >>>new file mode 100644
> >>>index 0000000..fabb878
> >>>--- /dev/null
> >>>+++ b/fs/custom/Config.in
> >>>@@ -0,0 +1,18 @@
> >>>+config BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE
> >>>+	string "partition table"
> >>
> >>  In most cases, we don't rely on the non-emptiness of a string to determine
> >>if some option is enabled or not, but rather there's an explicit config
> >>option to enable it. I'm not convinced that that is a good principle, but
> >>it's how things are done now.
> >
> >OK, I see.
> >
> >My reasoning is that passing the path to the "partition table" is enough
> >to state that the user does want to use a partition table, hence I did
> >not hide it behind a bool.
> >
> >That's what we do for (eg.) BR2_ROOTFS_DEVICE_TABLE: if it is empty, we
> >treat it as to not add any device. The fact that the option is set/unset
> >is in itself enough to act or not.
> >
> >The boolean below is indeed needed since we do need a boolean for our
> >internal use, but I see no reason to hide the string option behind the
> >boolean. Hence the boolean is a blind option.
> 
>  Again, I agree with your reasoning but it doesn't comply with current
> policy (BR2_ROOTFS_DEVICE_TABLE is not such a great example BTW, because it
> defaults to non-empty and it is not used in Kconfig conditions).

OK, I'll change it, you're right.

> [snip]
> >>>diff --git a/fs/custom/custom.mk b/fs/custom/custom.mk
> >>>new file mode 100644
> >>>index 0000000..940a32a
> >>>--- /dev/null
> >>>+++ b/fs/custom/custom.mk
> >>>@@ -0,0 +1,14 @@
[--SNIP--]
> >>>+ BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \"$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE)\"
> >>
> >>  Should be indented with a tab.
> >
> >No, because it is used as:
> >
> >     echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
> 
>  Err... Most of the other ROOTFS_FOO_CMD definitions use tab indentation,
> which is the standard for Buildroot. Only tar and squashfs which are really
> really old use spaces.

OK, will change.

But notice that the tab requirement is only for cosmetics. For package,
we do need a tab, since the commands are expanded directly as a make
command block, which is not the case for the filesystems.

> >>  Does that quoting work? It sill expand to
> >
> >Yes it does, because it is interpreted twice (not sure how, but if I
> >remove the quotes and set BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE="foo bar"
> >then genimages gets two args, not one. Don;t ask me, double indirection
> >in the Makefile fragemnt plus shell expansion, something like it...
> 
>  That is fully explained by the expansion below:
> 
> >>genimages \""path/to/partitiontable"\"
> >>  so genimages' $1 will be "path/to/partititiontable" including the quotes.
> >
> >No, because both quotes have already been stripped away.
> 
>  You're right about the no, but not about the reason :-)  It is used as:

Yep, I noticed it later after I replied.

>  Anyway, I think it should be:
> 
> BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \
> 	'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'

I'm using double quotes here, now, instead of single quotes.
Otherwise, consider it changed. Thanks!

> >>>+endef
> >>>+
> >>>+# We need the tarball to be generated first
> >>
> >>  This comment is redundant
> >
> >What about:
> >
> >     # rootfs-custom uses rootfs.tar as the source to generate the
> >     # resulting image(s), so we need to build it first.
> >
> >Also, I forgot to add:
> >     rootfs-custom-show-depends:
> >         @echo $(ROOTFS_CUSTOM_DEPENDENCIES)
> 
>  Doesn't ROOTFS_TARGET add that?

Yes, I was looking at initranfs, which does not use the fs infra, so
needs to add it itself. I removed it now.

> >>>diff --git a/fs/custom/genimages b/fs/custom/genimages
> >>>new file mode 100755
> >>>index 0000000..aba3021
> >>>--- /dev/null
> >>>+++ b/fs/custom/genimages
> >>>@@ -0,0 +1,214 @@
> >>>+#!/bin/bash
> >>
> >>  I have a general question for the maintainers here:
> >>
> >>* Do we really want to rely on bash even more?
> >
> >bash is already a hard-dependency of Buildroot. anyway.
> 
>  Yes, but I think it's just because of the apply-patches script. That's why
> I ask: do we want to make this hard dependency even harder, or do we prefer
> to go for posix shell as much as possible.

Well, POSIX is lacking the arrays, and the associative arrays I use
extensively throughout the script.

>  That said, now I've read the script in a bit more detail: making them
> posix-shell compliant would be pretty hard.

Yep.

> >>* Would it make sense to implement complex things like this in a proper
> >>programming language (read: python), which would solidify our dependency on
> >>python?
> >
> >I don't do Python.
> 
>  Good reason.

Hehe! :-)

> >>  With python's ConfigParser, this file would be reduced to +- 20 lines...
> >
> >Does ConfigParser handles lines like:
> >    key=$((4*1024))
> 
>  Obviously not, it would have to be
> key = 4*1024

For my education, are the spaces required? Because they are not in .ini,
and in fact should not be present.

> >>>+        line="$( sed -r -e 's/[[:space:]]*#.*$//; //d;' <<<"${line}" )"
[--SNIP--]
> >>  To make this incredibly complex line a little more readable, I'd split it
> >>in two lines:
> >>
> >>     line="$( sed -e 's/[[:space:]]*#.*$//' <<<"${line}" )"
> >>     line="$( sed -e '//d;' <<<"${line}" )"
> >
> >"Incredibly complex"? You're kidding, aren't you?
> 
>  No, I'm not kidding. I had to do sed --help to remember what -r is about, I
> had to think a little about the <<< construct, I had to read the sed
> expression two times before I noticed the ;, and only then I could start
> parsing the regex.

Hmm, looks like I have a knack in regexps! It looked trivial to me.
And <<< is a bash construct that I use everyday.

> >Besides, yours is
> >broken, since '//d;' relies on the previous expresion. ;-p
> 
>  ... and even then I failed to notice that // is not the same as /^$/ :-)
> 
>  But so the //d is actually redundant. Because it matches the part that was
> just removed, so it never matches.

Hmmm. I'll have to check that again, then...
/me fumbles a bit...
Indeed, it seems unneeded. I'll remove it.

So, it was not so trivial after all! :-)

> >>>+    # Create lists of devices, partitions, and partition:device pairs.
> >>>+    debug "creating intermeditate lists\n"
> 
>  intermediate

Doh! Roh... :-)

>  But perhaps you need to mediate a little in the middle of this function?
> :-)

Yes, I think I'll both meditate and mediate that stuff! :-)

> >>>+    devices=( ${values["global:devices"]//,/ } )
> >>>+    for dev in "${devices[@]}"; do
> >>>+        partitions=( ${values["${dev}:partitions"]//,/ } )
> >Hmm. Bug here -------^ should be += I think.
[--SNIP--]
> >>  I'm not very familiar with bash array syntax, but can't you use something
> >>like "for part in ${partitions[@]}" ?
> >
> >But how do I know what device a partition is on?
> >(but do I need that anyway?) I'll check.
> 
>  With the += correction you mentioned above, your code makes a lot more
> sense.

Aha! :-)

Thanks again!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
