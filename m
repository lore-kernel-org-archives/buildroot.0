From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Mar 2020 13:14:05 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: don't hang the build if there
 are no file lists
In-Reply-To: <CAAXf6LXzTLt-eUfG8zsVRB-LNfc_jo01R9bWKDzDPH6ZLtnFMg@mail.gmail.com>
References: <20200312091530.287681-1-thomas.petazzoni@bootlin.com>
 <20200312091530.287681-2-thomas.petazzoni@bootlin.com>
 <CAAXf6LXzTLt-eUfG8zsVRB-LNfc_jo01R9bWKDzDPH6ZLtnFMg@mail.gmail.com>
Message-ID: <20200317131405.487ce542@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 17 Mar 2020 12:13:24 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> An alternative approach that does not require checking for empty, is
> to quote the argument to cat. I.e.
> cat "$(sort ...)" will not hang. It would give an error though, so
> your check is actually better.

OK. By the way, did you test the new logic in your use-cases? I know
you've been using these file lists as you've contributed some changes
in this area. Peter applied my patches very quickly (which is good, of
course), but that didn't leave a lot of time for people to give some
feedback.

> But I found two additional problems in this area:
> 
> 1. packages that set FOO_SUBDIR will have their file list created in
> the FOO_SUBDIR, and it is not picked up by the current '$(wildcard
> $(BUILD_DIR)/*/.files-list.txt)'.  Since make does not support a '**'
> as recursive wildcard, we'd need to use a find or a more clever
> method.

What about generating the files in $($(PKG)_DIR) instead of
$($(PKG)_BUILDDIR) ? This way, it will always be in
output/build/foo-version/ and never in a sub-directory.

> 2. Previously, the packages-file-list.txt was already available by the
> time the post-build scripts are run. But with the recent changes, this
> is no longer true. Moving the 'cat' lines up solves that.
> 
> For 2 I have a patch but it conflicts with the above ones, so better
> to apply yours first. Alternatively I can send the entire series. Let
> me know what you prefer.

You can send the entire series I'd say. If you have tested my patch,
add your Reviewed-by/Tested-by, so that I can apply my own patch as
well :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
