From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Jan 2016 02:02:01 +0100
Subject: [Buildroot] Standardizing format for specifying license(s)
In-Reply-To: <20160115145153.39e486e3@free-electrons.com>
References: <5698DDBE.3000402@imgtec.com>
 <1a9e07dbd834ef9ca57e1b6a91d043c2@localhost>
 <20160115145153.39e486e3@free-electrons.com>
Message-ID: <56999689.7040605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-01-16 14:51, Thomas Petazzoni wrote:
> Alexander,
> 
> On Fri, 15 Jan 2016 14:12:47 +0100, Alexander Dahl wrote:
> 
>> If not already done, I would suggest to have those license stuff
>> compatible with SPDX [1]. I noticed license names in at least some
>> packages are not the same as the identifiers on
>> https://spdx.org/licenses/ ? so if someone wants to generate SPDX stuff
>> from a buildroot project, it maybe would be better to have a format for
>> names and delimiters which make it easier towards SPDX package data.
> 
> We normally try to use the SPDX license code, at least for "new"
> licenses (i.e licenses for which we don't yet have a single Buildroot
> package under that license). However, for the first licenses (like GPL,
> LGPL, etc.), we have started using an encoding that is not the one from
> SPDX. I would personally be in favor to move to SPDX license codes
> everywhere, but that would break things for people that are currently
> parsing our license information. Is this reasonable to do nonetheless?

 Like Luca, I believe that we can still afford to change it now.

 However, I'm not sure if it is worth it. SPDX short tags often look ugly
(BSD-3-Clause) and is anyway not sufficient (see below). For the list of tags we
have, it's easy enough to convert it to the SPDX tag automatically by a
post-processing tool if someone feels so inclined.

> 
> The Buildroot documentation already has a license of license
> abbreviations:
> https://buildroot.org/downloads/manual/manual.html#legal-info-list-licenses.
> 
> Note that http://spdx.org/sites/spdx/files/SPDX-2.0.pdf, page 82 and
> 83, has a description of a syntax for composite license expressions.

 Unfortunately this syntax is a bit unwieldy. The license identifier must be
either one of the official ones, or something matching
LicenseRef-[-+.a-zA-Z0-9]+ - for somewhat complicated licenses, it looks ugly.
If it is a composite expression, it must be enclosed in (). And if there is an
exception, it again must come from the official list - if it's not in the list,
a new LicenseRef must be created. I could live with converting spaces to -, but
anything beyond that is not a good idea IMHO.

 Also, it doesn't allow to express some of the things we want to express in our
license statements. In particular, the "GPLv2+ (programs), LGPLv2 (library)" is
not possible. In SPDX, every individual (source or binary) file is supposed to
have a concluded license, and the concluded license of the package is the thing
that applies when all files are distributed together.

 So I don't think we should go for fully formal SPDX, and I see little advantage
in choosing something that resembles formal SPDX but is not quite it. I think
that for someone who uses SPDX, the licensing info we give is never anything
more than a hint so there is no need to make it almost-SPDX.


 Bottom line: I'm completely in-line with the OP's proposal, as amended by
ThomasP (/ -> or). And I'm open to converting some or all existing tags to the
SPDX ones.

> 
> One case that SPDX doesn't allow to encode is "GPL" or "LGPL", i.e the
> cases where the software is said to be licensed under the GPL or LGPL,
> but without any version information. Yes this sucks because in practice
> it means you don't know the corresponding license text. But sometimes,
> this is the only information provided by the package source code.

 Yeah, so that would have to become LicenseRef-GPL...


 Regards,
 Arnout


> 
> Examples:
> 
> MII_DIAG_LICENSE = GPL # No version specified
> tslib/tslib.mk:TSLIB_LICENSE = GPL, LGPL
> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
