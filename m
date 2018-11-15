From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2018 20:05:58 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <016ed0ed-6489-2fa0-a32e-9f2a6918af01@mind.be>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
 <87bm6svqpy.fsf@grinn-global.com>
 <20181113210216.37879bd4@windsurf> <20181113202946.GH10271@scaer>
 <016ed0ed-6489-2fa0-a32e-9f2a6918af01@mind.be>
Message-ID: <20181115190558.GM10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-14 00:54 +0100, Arnout Vandecappelle spake thusly:
> On 13/11/2018 21:29, Yann E. MORIN wrote:
> > On 2018-11-13 21:02 +0100, Thomas Petazzoni spake thusly:
> >> On Tue, 13 Nov 2018 18:20:57 +0100, Marcin Niestr?j wrote:
> >>> I think the overall conclusion is that a host-gzip package is needed,
> >>> just like host-tar. In the meantime I will send v3 of this patch with
> >>> proper hash (the same as you calculated above).
> >> This is getting really horrible.
> > Well, we only need host-tar and host-gzip when creating tarballs, not
> > extracting them, correct? So, we could very well envision the fact that
> > host-tar (and host-gzip) are only added to FOO_DOWNLOAD dependecies when
> > FOO_SITE_METHOD == git (and they are needed, of course), no?
> 
>  Since we have the same problems sometimes with github tarballs, I think we need
> a more fundamental solution. I would propose a new tarsha256 hash type, which
> extracts the tarball to calculate the hash. In a simple version it's not so
> complicated, something like
> 
> tar -xf - --to-command=$(TOPDIR)/support/scripts/tarsha256 | sort | sha256sum -
> 
> where tarsha256 contains:
> 
> { echo $TAR_FILENAME; echo $TAR_MODE; echo $TAR_FILETYPE; cat - } | \
> 	sha256sum - | cut -f 1 -d ' '
> 
> As usually, entirely untested.

I don't like it, because this is totally non-standard. People expect to
be able to check hashes by running the *usual* XXXsum commands, directly
on the shipped/received files.

Introducing our own hash mechanism, how reliable or simple as it would
be, breaks this assumption, and the tool to actually check them is not
available at all except internally to Buildroot, so it is not possible
to reproduce the checks outside of Buildroot.

This goes counter one of the initial goal of hashes, which is to be able
to track archives and their validity across a supply chain, inbound (as
sent by a provider to Buildroot, to do the build) or outbound (as received
by a recepient, from Buildroot, for compliance) alike.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
