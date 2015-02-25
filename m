From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 25 Feb 2015 11:48:22 +0100
Subject: [Buildroot] [RFC 1/2] Makefile: add target-genimage
In-Reply-To: <CANxTyt6R72Yi_e15rHX4=vY9vwL2Yd+LEoUeB8C9BY7gbKkSXg@mail.gmail.com>
References: <1423780427-7493-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1423780427-7493-2-git-send-email-vivien.didelot@savoirfairelinux.com>
 <CANxTyt4ojT7Y+mG9+Je_gY0dD2Ub3nxfcuoXtD1F-sPcbcmY6g@mail.gmail.com>
 <2004056362.2924318.1424104885214.JavaMail.root@savoirfairelinux.com>
 <CANxTyt6R72Yi_e15rHX4=vY9vwL2Yd+LEoUeB8C9BY7gbKkSXg@mail.gmail.com>
Message-ID: <54EDA876.9010200@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear Vivien,


looks good so far, and it fits well into my workflow, thanks for your
contribution.
Unfortunately the out-of tree build is broken with this version,
please see inline in your patch my comment.
I would propose to resend this patch with the fixed typos and the fix
for the out-of-tree build.


On 17.02.2015 03:37, Danomi Manchego wrote:
> Vivien,
> 
> On Mon, Feb 16, 2015 at 11:41 AM, Vivien Didelot 
> <vivien.didelot@savoirfairelinux.com> wrote:
>> Hi Danomi,
>> 
>>> A couple nitpicks ...
>> 
>> [...]
>> 
>>>> The rational behind adding this to Buildroot is that
>>>> genimage requires
>>> 
>>> spelling: "rationale".
>> 
>> Thanks.
>> 
>> [...]
>> 
>>>> --- a/Makefile +++ b/Makefile @@ -434,7 +434,7 @@ world:
>>>> target-post-image
>>>> 
>>>> .PHONY: all world toolchain dirs clean distclean source 
>>>> outputmakefile \ legal-info legal-info-prepare
>>>> legal-info-clean printvars \ -       target-finalize
>>>> target-post-image \ +       target-finalize target-genimage
>>>> target-post-image \ $(TARGETS) $(TARGETS_ROOTFS) \ 
>>>> $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) 
>>>> \ $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \ @@ -621,7
>>>> +621,20 @@ endif $(call MESSAGE,"Executing post-build script
>>>> $(s)"); \ $(EXTRA_ENV) $(s) $(TARGET_DIR) $(call 
>>>> qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>>>> 
>>>> -target-post-image: $(TARGETS_ROOTFS) target-finalize 
>>>> +target-genimage: $(TARGETS_ROOTFS) target-finalize +
>>>> @$(foreach cfg, $(call qstrip,$(BR2_ROOTFS_GENIMAGE_CFG)), \ 
>>>> +       $(call MESSAGE,"Executing genimage with config
>>>> $(cfg)"); \ +         T=$$(mktemp -d
>>>> $(BUILD_DIR)/.genimage.XXXXXXXXXX); \ +         mkdir -p
>>>> $$T/{root,tmp}; \ +         $(EXTRA_ENV)
>>>> output/host/usr/bin/genimage \
should be $(HOST_DIR)/output/host/



>>>> +         --rootpath $$T/root \ +         --tmppath $$T/tmp
>>>> \ +         --inputpath output/images/ \ +
>>>> --outputpath output/images/ \
both of the paths should be $(BINARIES_DIR)


>>>> +         --config $(cfg); \ +         rm -rf $$T$(sep))
>>> 
>>> I don't think the final $(sep) is needed, since this the last
>>> line of a makefile target, as opposed to, say. a template.
>> 
>> Are you sure? I'm not sure either but I tried to follow the other
>> foreach statements.
> 
> Ah, so sorry, I missed the fact that it was a foreach.  Comment
> retracted!
> 
> 
>> Thanks for the nitpicks. Other than that, an feedback on the
>> overall RFC?
> 
> Sorry, I haven't actually tried it.
> 
> Danomi -
> 
> 
>> Regards, Vivien
> _______________________________________________ buildroot mailing
> list buildroot at busybox.net 
> http://lists.busybox.net/mailman/listinfo/buildroot
> 



- -- 
Bests,
Zoltan Gyarmati
IRC freenode: zgyarmati
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJU7ah2AAoJEAGmEeeR8iVhZ38H/0ZX29k/tKM3zjy05jwAGEcE
OM0ySLjhIH+8843/CaNBszDXhG7kIxvfpFfX6ugGnmPJ2NAWu3ajnqk9oYHYkDyN
gJJ7cN7aKo1RzVz64idZNY4ZyOxWyJVAK8vuLroQMOZO2h3Ztepf577UsfayfE82
ThIY4tmAgwbIrdoWeC6R6YGtlMgIMpyzEtQe4FGqNYhMT29XMhyvAJfGt0Ep+EMR
o7FKZrBWMr+G+mX2M6QuFTPcAcY5hffqRUccOOp1pS5ciVSeOVkr2yUnlMpS5CNQ
8gCBAXjd2k/bWBpkdnn09xltVZQlOg1NysC4f7S1vqqFRrF9dfGv22Viz/I7yqA=
=kvfn
-----END PGP SIGNATURE-----
