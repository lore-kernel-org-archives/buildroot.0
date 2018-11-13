From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Nov 2018 00:54:15 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <20181113202946.GH10271@scaer>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
 <87bm6svqpy.fsf@grinn-global.com> <20181113210216.37879bd4@windsurf>
 <20181113202946.GH10271@scaer>
Message-ID: <016ed0ed-6489-2fa0-a32e-9f2a6918af01@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/11/2018 21:29, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-11-13 21:02 +0100, Thomas Petazzoni spake thusly:
>> On Tue, 13 Nov 2018 18:20:57 +0100, Marcin Niestr?j wrote:
> [--SNIP--]
>>> I think the overall conclusion is that a host-gzip package is needed,
>>> just like host-tar. In the meantime I will send v3 of this patch with
>>> proper hash (the same as you calculated above).
>>
>> This is getting really horrible.
>>
>> On my side, I have updated to Fedora 29, which ships tar 1.30, that we
>> consider as broken, and therefore now for everything single small build
>> that I do, I'm paying the price of building tar, which is super
>> annoying. This is especially annoying as tar 1.30 is only problematic
>> when *creating* tarballs of git-fetched packages, which clearly does
>> not happen at every build.
> 
> Well, we only need host-tar and host-gzip when creating tarballs, not
> extracting them, correct? So, we could very well envision the fact that
> host-tar (and host-gzip) are only added to FOO_DOWNLOAD dependecies when
> FOO_SITE_METHOD == git (and they are needed, of course), no?

 Since we have the same problems sometimes with github tarballs, I think we need
a more fundamental solution. I would propose a new tarsha256 hash type, which
extracts the tarball to calculate the hash. In a simple version it's not so
complicated, something like

tar -xf - --to-command=$(TOPDIR)/support/scripts/tarsha256 | sort | sha256sum -

where tarsha256 contains:

{ echo $TAR_FILENAME; echo $TAR_MODE; echo $TAR_FILETYPE; cat - } | \
	sha256sum - | cut -f 1 -d ' '

As usually, entirely untested.

 Regards,
 Arnout

> 
> (note: tar is ugly, because its configure step takes ~26s, while the
> build is only ~4s).
> 
>> It would be truly horrible to also have to build our own gzip. Maybe we
>> need to somehow revisit our requirement that we need to have
>> reproducible tarballs for git-fetched packages ?
> 
> I am ready to pay the price for reproducibility any time.
> 
> Regards,
> Yann E. MORIN.
> 
