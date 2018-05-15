From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2018 23:39:59 +0200
Subject: [Buildroot] [PATCH] skeleton: create include/ directory
In-Reply-To: <20180514080315.049085b2@windsurf.home>
References: <9873d2e0023b87545478d0615eb5d97bcbd82c2c.1526268236.git.baruch@tkos.co.il>
 <20180514080315.049085b2@windsurf.home>
Message-ID: <9adcf72e-831b-9190-2b52-a28d86a9526e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-05-18 08:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 14 May 2018 06:23:56 +0300, Baruch Siach wrote:
>> Don't rely on a random host package to create the include/ directory for
>> us. Some packages do the wrong thing since they implicitly assume that
>> this directory exists already. Commit a557aedad2 (zstd: fix host headers
>> installation) shows an example of that.
>>
>> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  package/skeleton/skeleton.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>> index efcf420d7243..9d97f02f08bf 100644
>> --- a/package/skeleton/skeleton.mk
>> +++ b/package/skeleton/skeleton.mk
>> @@ -16,6 +16,7 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
>>  define HOST_SKELETON_INSTALL_CMDS
>>  	$(Q)ln -snf . $(HOST_DIR)/usr
>>  	$(Q)mkdir -p $(HOST_DIR)/lib
>> +	$(Q)mkdir -p $(HOST_DIR)/include
> 
> Following the zstd patch, I was discussing this with Yann on IRC, and
> my thinking is that we normally shouldn't have to do something like
> this. Packages that install stuff in ${prefix}/include should create
> this folder as needed.
> 
> Now, it is true that we already create $(STAGING_DIR)/include, and it
> doesn't cost much to create such a directory ahead of time.

 Well, basically, for any problem that is really due to the package build system
that is wrong (which is 90% of the problems we are dealing with :-), we have two
options:
- an upstreamable patch;
- a sweeping catch-all change to Buildroot that fixes all packages.

 Although upstreamable patches are nice because we improve the world, there are
a couple of disadvantages:
- it's a Sisyphean task, upstreams will make the same mistakes all over;
- it's more work for us;
- we have more breakage;
- we have a significant number of packages without upstream (dead, or never
there cfr. vendor-supplied code dumps).

 Therefore, the sweeping catch-all fix is pretty attractive. So I would actually
say we prefer such a solution iff:

1. it is simple (maintainable);
2. it is effective (guaranteed to fix the problem in all cases);
3. it is harmless (guaranteed not to break anything that used to work);
4. it is logical (when you see it, you don't think wtf?);
5. it is needed for several packages.

 We already have quite a number of sweeping catch-alls that don't satisfy these
criteria, e.g. toolchain wrapper, libtool patching.

 This patch, on the other hand, fits the criteria nicely. Except for the 5th
one, but IMO that one is less important.

 Bottom line:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
