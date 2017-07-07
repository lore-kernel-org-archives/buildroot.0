From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 17:18:11 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
 fit for multi-user setups
In-Reply-To: <87podcwpbb.fsf@dell.be.48ers.dk>
References: <20170706104841.7711-1-peter@korsgaard.com>
 <20170706212148.4f6a4f47@windsurf.lan> <87y3s1w672.fsf@dell.be.48ers.dk>
 <20170707092808.23bae4fd@windsurf.lan> <87podcwpbb.fsf@dell.be.48ers.dk>
Message-ID: <904fdb4b-2dd4-af9b-ac79-8e31cc554647@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-07-17 11:48, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  >> No, but as far as I read the ccache code, it will create the cache dir +
>  >> parent directories if they don't exist.
>  >> 
>  >> E.G.:
>  >> 
>  >> CCACHE_DIR=/tmp/some/funky/sub/directory ccache -s
>  >> cache directory                     /tmp/some/funky/sub/directory
>  >> primary config                      /tmp/some/funky/sub/directory/ccache.conf
>  >> secondary config      (readonly)    /etc/ccache.conf
>  >> cache hit (direct)                     0
>  >> cache hit (preprocessed)               0
>  >> cache miss                             0
>  >> cache hit rate                      0.00 %
>  >> cleanups performed                     0
>  >> files in cache                         0
>  >> cache size                           0.0 kB
>  >> max cache size                       5.0 GB
>  >> ls -l /tmp/some/funky/sub/directory
>  >> total 4
>  >> -rw-r--r-- 1 peko peko 16 Jul  7 00:26 ccache.conf
> 
>  > OK, but I definitely don't want ccache to create a random directory
>  > somewhere in my $HOME folder, just because it was hardcoded into the
>  > ccache binary.
> 
> Ehh, that is what ccache normally does (E.G. ~/.ccache), similar to a
> bunch of other utilities. Without this change things will just break
> instead as you most likely don't have a /home/peko/.buildroot-ccache on
> your system (or if you do, have write access to it).

 I think Thomas's point is: ~/.br-ccache is fine, ~/foo/bar/directory is not
fine, even if that is what was configured in the buildroot config from which the
external toolchain was generated (and which is NOT the buildroot configuration
used by the final user, otherwise this problem wouldn't even occur).


>  >> Hardcoding /home/thomas/.buildroot-ccache is very unlikely to work for
>  >> other users, whereas ~/.buildroot-cache is quite likely.
> 
>  > Sure. But if I set BR2_CCACHE_DIR to /opt/ccache/, it won't work when
>  > the SDK is moved to another machine (permissions may not be set), and
>  > if I set BR2_CCACHE_DIR to $HOME/projects/foobar/cache/, and you run my
>  > SDK on your system, you will get this funky folder created.
> 
> You presumably would have specific reasons to customize BR2_CCACHE_DIR
> like this (and make the needed arrangements to have E.G /opt/ccache
> available), so I don't see what the problem would be.
> 
> Having a BR2_CCACHE_DIR option (with a default value of
> $(HOME)/.buildroot-cache) ending up hardcoding
> /home/$sdkbuilduser/.buildroot-cache in the binary seems to me far from
> obvious behavior and goes against the goals of reproducible builds and
> reusable sdks.

 I think Thomas, like me, means that we should instead revert
d93a0b402934309c632d4a825b7fe6183ce8c4c7.

 In fact, I think we should drop this Buildroot-specific patching entirely. As
far as I can see, BR_CACHE_DIR was introduced to replace the normal CCACHE_DIR
because way back when our ccache didn't reliably detect the compiler and would
reuse object files that we actually created with a different toolchain. So the
Buildroot-specific ccache would disable fingerprinting completely. Obviously, if
it would then reuse the same cache directory as the normal ccache, there would
be a huge risk that target ccache would use cached objects for the host...

 Nowadays we have the fingerprinting in place (which is hopefully still
reliable), so the reason for have a separate cache dir is gone IMO. So I think
we should just use CCACHE_DIR instead of BR_CACHE_DIR. BR2_CCACHE_DIR still
makes sense, since you may want to encode a shared ccache in your Buildroot
config. But I think it should default to empty, where empty means don't export
CCACHE_DIR and rely on ccache's default.

 Such a change, however, would first require a test to be set up. And testing
ccache is decidedly non-trivial. Therefore it's a more long-term goal.
Therefore, this patch makes sense after all. Indeed, if a user currently
generates an SDK with the default configuration, it will definitely do the wrong
thing (pointing to another user's br-ccache directory). So I'll change my weak
NACK into a weak ACK.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
