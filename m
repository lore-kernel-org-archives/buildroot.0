From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 02 Nov 2017 19:27:11 +0100
Subject: [Buildroot] Parallel top-level make and multiple rootfs types
In-Reply-To: <71023202-b51d-49cb-bcf0-a49cffb7414a@cesnet.cz>
References: <71023202-b51d-49cb-bcf0-a49cffb7414a@cesnet.cz>
Message-ID: <daa6be72-cbd0-4f65-8e48-83d1c43ddd8c@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?tvrtek 26. ??jna 2017 1:10:05 CEST, Jan Kundr?t wrote:
> Hi,
> I've enabled that unsupported feature for parallel top-level 
> make by removing ".NOTPARALLEL". I'm doing this because it cuts 
> my build time by a factor of four (roughly 50min -> 12min; yes, 
> these serialized configure steps are extremely expensive on a 
> 24-core build node).
>
> Everything works well for me up to and including the 
> `target-finalize` step. I have multiple CONFIG_TARGET_ROOTFS_*, 
> and their rules clobber each other's auxiliary files, either 
> directly (_fakeroot.fs), or via mkusers which creates duplicate 
> rows in target/etc/group.
>
> I tried to fix this by something like:
>
>  .NOTPARALLEL: $$(BINARIES_DIR)/rootfs.$(1)
>
> ...but it just caused the entire build to once again become 
> serial, package-after-package, which is not what I want.
>
> Is there a better fix than running `make -j32 target-finalize 
> && make` as a workaround?

Hi,
can I disable parallel execution of the rootfs-* build steps while still 
building everything up to target-finalize in parallel?

Cheers,
Jan
