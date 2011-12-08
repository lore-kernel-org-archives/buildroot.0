From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Dec 2011 11:41:52 +0100
Subject: [Buildroot] [PATCH 2 of 3 v2] dependencies: build a host-tar if
 no suitable tar can be found
In-Reply-To: <201112061807.48048.arnout@mind.be>
References: <patchbomb.1322053783@devws108>
 <d4b15640ce2d3ab89835.1322053785@devws108>
 <20111123152440.0fef75ca@skate> <201112061807.48048.arnout@mind.be>
Message-ID: <CAAXf6LVqXTShGnjV7cDON6jU-yWGi0wrGCaZVHZAFJUystnNQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 6, 2011 at 6:07 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Wednesday 23 November 2011 15:24:40 Thomas Petazzoni wrote:
>
>> > TAR is redefined to HOST_TAR, except when extracting host-tar (this
>
>> > is a chicken-and-egg problem), so that all packages use the host-tar
>
>> > if no suitable tar was found.
>
>>
>
>> I am still puzzled by the fact that tar is needed to extract this
>
>> host-tar, so there's like a chicken-and-egg problem. I understand that
>
>> the real host tar is used to extract the host-tar, which is then use to
>
>> extract all other packages. But that sounds really nasty to me.
>
>
> It's not so strange, it's like a compiler's canadian build. You need a
>
> compiler to compile the compiler, right?
>
>
> The way it is solved for tar is OK for me. I think adding support for
>
> cpio archives would just complicate things, because then host-tar
>
> can't use GENTARGETS anymore.

I don't think that's true. I started adding cpio support to
gentargets. Essentially, here is the code that needs modification:

# Define extractors for different archive suffixes
INFLATE.bz2  = $(BZCAT)
INFLATE.gz   = $(ZCAT)
INFLATE.tbz  = $(BZCAT)
INFLATE.tbz2 = $(BZCAT)
INFLATE.tgz  = $(ZCAT)
INFLATE.xz   = $(XZCAT)
INFLATE.tar  = cat

$(2)_EXTRACT_CMDS ?= \
        $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE)))
$(DL_DIR)/$$($(2)_SOURCE) | \
        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)


Although the inflate step already handles multiple suffices, the
extract does not yet.

My current approach is this:
+INFLATE.cpio = cat
+
+EXTRACT.tar = $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(1) $(TAR_OPTIONS) -
+EXTRACT.cpio = ( mkdir -p $(1) && cd $(1) && cpio -i )

 $(2)_EXTRACT_CMDS ?= \
        $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE)))
$(DL_DIR)/$$($(2)_SOURCE) | \
-       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
+       $$(if $$(EXTRACT$$(suffix $$($(2)_SOURCE))),$$(call
EXTRACT$$(suffix $$($(2)_SOURCE)),$$($(2)_DIR)),$$(call
EXTRACT$$(suffix $$(basename $$($(2)_SOURCE))),$$($(2)_DIR))))


The only thing I'm struggling with is that cpio does not have a
--strip-components functionality. As a result, the package is
extracted in output/build/host-tar-1.26/tar-1.26 which is not right.
I don't directly know the name 'tar-1.26', because all I have is the
string 'host-tar-1.26'. I see two approaches:
* either try to strip of 'host' from $(2)_DIR
* or do something like 'mv * .' or 'find -maxdepth 1 -type d | xargs mv {} .'

Suggestions are much appreciated...

Thanks,
Thomas
