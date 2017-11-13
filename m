From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 13 Nov 2017 08:17:20 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <20171112174250.GD2947@scaer>
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home> <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <20171112174250.GD2947@scaer>
Message-ID: <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 12.11.2017 um 18:42 schrieb Yann E. MORIN:
> On 2017-11-12 18:24 +0100, Thomas Petazzoni spake thusly:
>> Hello,
>>
>> On Sun, 12 Nov 2017 18:15:12 +0100, Peter Korsgaard wrote:
>>
>>>   > So this happens because the ARC binutils version is fetched from Git,
>>>   > so we need to have host-flex installed, and binutils detects the flex
>>>   > library and decides to use it.
>>>
>>> And there is no configure flag to disable that?
>>
>> Not that I can see.
> 
> A long time ago (when I was too young to have a beard), libfl was only
> available as a static library.
> 
> That library contained (and stil contains) a 'main()' symbol (is it even
> a weak one?), so it really is a weird library to begin with... I would
> not mind building that host library with --disable-shared --enable-static
> and only install the static library...
> 
> That would solve this specific issue.
> 
> Until we need another library...
> 
>>>   >> - The absolute rpath in $(HOST_DIR)/<tuple>/bin/ar is wrong in the
>>>   >> first place, but I'm not sure how to fix this.
>>>
>>>   > I'm wrong on this: $(HOST_DIR)/<tuple>/bin/ar RPATH is totally fine:
>>>
>>>   > $ readelf -d arc-buildroot-linux-uclibc/bin/ar  | grep rpath
>>>   >  0x000000000000000f (RPATH)              Library rpath: [/opt/br-arcle-hs38-full-2017.11-rc1/lib]
>>>
>>>   > The problem is that this gets turned into $ORIGIN/../lib by patchelf.
>>>
>>>   > I don't see any other solution than de-duplicating such binaries.
>>>
>>>   > Do you see another option ?
>>>
>>> Not if we *need* both binaries (do we?)
>>
>> I think we do need both binaries. <tuple>-<tool> is the "publicly"
>> visible copy, while <tuple>/bin/<tool> is the one called internally by
>> gcc (for example when it calls as or ld). Yann can explain more about
>> this perhaps.
> 
> I can't explain much more than you did, sorry...
> 
>>> Is there a way to get binutils to use soft links instead of hard links?
>>
>> How would this solve the problem?
> 
> I guess the reasoning of Peter was that maybe $ORIGIN is relative to the
> real file not the symlink.
> 
> Thus by having <tuple>/bin/<tool> a symlink to ../../bin/<tuple>-<tool>
> would solve the issue.
> 
> But I am not sure of it either, and the manpage for ld.so does not
> mention that. It only states:
> 
>      $ORIGIN (or equivalently ${ORIGIN})
>          This expands to the directory containing the program or
>          shared object.
> 
> No mention of the behaviour when the program is being called through a
> symlink in another directory... :-/

A symlink seem to be resolved before using $ORIGIN:

  $ cd <buildroot-build-dir>

  $ ldd host/bin/xgettext
  ...
	libgettextsrc-0.19.8.1.so => /work/bdo/dcu/host/bin/../lib/libgettextsrc-0.19.8.1.so (0x00007f2ae6832000)
	libgettextlib-0.19.8.1.so => /work/bdo/dcu/host/bin/../lib/libgettextlib-0.19.8.1.so (0x00007f2ae652f000)

  # Hard link
  $ ln host/bin/xgettext xgettext
  $ ./xgettext
  ./xgettext: error while loading shared libraries: libgettextsrc-0.19.8.1.so: cannot open shared object file: No such file or directory

  # Soft link:
  $ rm xgettext
  $ ln -s ost/bin/xgettext xgettext
  $ ./xgettext
  ./xgettext: Eingabedatei fehlt

But:

  $ ldd xgettext
  ... 
	libgettextsrc-0.19.8.1.so => not found
	libgettextlib-0.19.8.1.so => not found

This means: A symbolic link would work.

Wofgang.
