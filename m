From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 10 Dec 2011 10:06:20 +0100
Subject: [Buildroot] [PATCH 2 of 3 v2] dependencies: build a host-tar if
 no suitable tar can be found
In-Reply-To: <201112090811.09604.minimod@morethan.org>
References: <patchbomb.1322053783@devws108>
 <201112080905.48711.minimod@morethan.org>
 <CAAXf6LUMprKGztV3fy7yW7JucNSf6L-+4+2BbySKrS=rBy3gUw@mail.gmail.com>
 <201112090811.09604.minimod@morethan.org>
Message-ID: <CAAXf6LUhfVqp35Zt7MfXaZGjaz91oW1Y0BWCBdU6XqnkiyH5=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 9, 2011 at 3:11 PM, Michael S. Zick <minimod@morethan.org> wrote:
> On Fri December 9 2011, you wrote:
>> On Thu, Dec 8, 2011 at 4:05 PM, Michael S. Zick <minimod@morethan.org> wrote:
>> > On Thu December 8 2011, Michael S. Zick wrote:
>> >> On Thu December 8 2011, Thomas De Schampheleire wrote:
>> >> > On Tue, Dec 6, 2011 at 6:07 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> >> > > On Wednesday 23 November 2011 15:24:40 Thomas Petazzoni wrote:
>> >> > >
>> >> > >> > TAR is redefined to HOST_TAR, except when extracting host-tar (this
>> >> > >
>> >> > >> > is a chicken-and-egg problem), so that all packages use the host-tar
>> >> > >
>> >> > >> > if no suitable tar was found.
>> >> > >
>> >> > >>
>> >> > >
>> >> > >> I am still puzzled by the fact that tar is needed to extract this
>> >> > >
>> >> > >> host-tar, so there's like a chicken-and-egg problem. I understand that
>> >> > >
>> >> > >> the real host tar is used to extract the host-tar, which is then use to
>> >> > >
>> >> > >> extract all other packages. But that sounds really nasty to me.
>> >> > >
>> >> > >
>> >> > > It's not so strange, it's like a compiler's canadian build. You need a
>> >> > >
>> >> > > compiler to compile the compiler, right?
>> >> > >
>> >> > >
>> >> > > The way it is solved for tar is OK for me. I think adding support for
>> >> > >
>> >> > > cpio archives would just complicate things, because then host-tar
>> >> > >
>> >> > > can't use GENTARGETS anymore.
>> >> >
>> >> > I don't think that's true. I started adding cpio support to
>> >> > gentargets. Essentially, here is the code that needs modification:
>> >> >
>> >> > # Define extractors for different archive suffixes
>> >> > INFLATE.bz2 ?= $(BZCAT)
>> >> > INFLATE.gz ? = $(ZCAT)
>> >> > INFLATE.tbz ?= $(BZCAT)
>> >> > INFLATE.tbz2 = $(BZCAT)
>> >> > INFLATE.tgz ?= $(ZCAT)
>> >> > INFLATE.xz ? = $(XZCAT)
>> >> > INFLATE.tar ?= cat
>> >> >
>> >> > $(2)_EXTRACT_CMDS ?= \
>> >> > ? ? ? ? $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE)))
>> >> > $(DL_DIR)/$$($(2)_SOURCE) | \
>> >> > ? ? ? ? $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
>> >> >
>> >> >
>> >> > Although the inflate step already handles multiple suffices, the
>> >> > extract does not yet.
>> >> >
>> >
>> > Is the inflate step being used for tar archives?
>> >
>> > The reason I ask is because GNU-tar (and BSD-tar) will auto-detect
>> > the compression method from the file and un-archive it without
>> > a prior de-compression.
>> >
>>
>> Yes, the inflate step is used for tar archives.
>>
>
> My point was, it does not need to.
> The INFLATE.* methods need only be available for use by things
> other than gnu-tar.
>
> Without leaving out any of the details (except the src/dest ls check):
>
> mszick at wolf466:~$ tar --create --file=foo.tar.gz *.txt
>
> mszick at wolf466:~$ ls -l *.tar.gz
> -rw-r--r-- 1 mszick mszick 501760 2011-12-09 08:02 foo.tar.gz
>
> mszick at wolf466:~$ mkdir tmp
> mszick at wolf466:~$ cd tmp
>
> mszick at wolf466:~/tmp$ tar --extract --file=../foo.tar.gz
>
> mszick at wolf466:~/tmp$ ls
> - - - shows the expected files - - -
>
> mszick at wolf466:~/tmp$ tar --version
> tar (GNU tar) 1.20
> Copyright (C) 2008 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
>
> Which is a pretty old gnu-tar.
> I think the auto-detect went in around 1.17 or so.

Thanks for the tip. I wasn't aware of this.

As long as tar supports all compression methods buildroot supports
(currently .gz, .bz2 and .xz) then we should be able to remove the
inflate step, I guess. I'll try to make a patch for this.

It doesn't help the cpio unpacking though, so it is more or less an
independent patch.

Best regards,
Thomas
