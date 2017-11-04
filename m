From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 21:56:58 +0100
Subject: [Buildroot] Parallel top-level make and multiple rootfs types
In-Reply-To: <daa6be72-cbd0-4f65-8e48-83d1c43ddd8c@cesnet.cz>
References: <71023202-b51d-49cb-bcf0-a49cffb7414a@cesnet.cz>
 <daa6be72-cbd0-4f65-8e48-83d1c43ddd8c@cesnet.cz>
Message-ID: <32f8ab99-e828-f276-fc5a-61f9955db8cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-11-17 19:27, Jan Kundr?t wrote:
> On ?tvrtek 26. ??jna 2017 1:10:05 CEST, Jan Kundr?t wrote:
>> Hi,
>> I've enabled that unsupported feature for parallel top-level make by removing
>> ".NOTPARALLEL". I'm doing this because it cuts my build time by a factor of
>> four (roughly 50min -> 12min; yes, these serialized configure steps are
>> extremely expensive on a 24-core build node).
>>
>> Everything works well for me up to and including the `target-finalize` step. I
>> have multiple CONFIG_TARGET_ROOTFS_*, and their rules clobber each other's
>> auxiliary files, either directly (_fakeroot.fs), or via mkusers which creates
>> duplicate rows in target/etc/group.
>>
>> I tried to fix this by something like:
>>
>> ?.NOTPARALLEL: $$(BINARIES_DIR)/rootfs.$(1)
>>
>> ...but it just caused the entire build to once again become serial,
>> package-after-package, which is not what I want.
>>
>> Is there a better fix than running `make -j32 target-finalize && make` as a
>> workaround?
> 
> Hi,
> can I disable parallel execution of the rootfs-* build steps while still
> building everything up to target-finalize in parallel?

 No, that's not possible with make. I don't know if Thomas has already thought
about this aspect of top-level parallel...

 I think the solution is to change the way we build the rootfs: instead of doing
the fakeroot steps over and over again, do it once, save with the -s option, and
then do the individual filesystems in a separate (readonly) fakeroot with -i to
read the previously created fakeroot file.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
