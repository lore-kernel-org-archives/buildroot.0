From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 20:47:10 +0200
Subject: [Buildroot] [PATCH=2020.02.x] package/redis: bump version to
 5.0.9
In-Reply-To: <b3cda0d9-b347-09ce-8b45-4ed29b500e48@railnova.eu>
References: <20200621213921.11923-1-peter@korsgaard.com>
 <8cb0702e-2c5d-553b-5793-681ddc619130@railnova.eu>
 <CAAXf6LWhoLwig3i8FNjC3OQ65h27y50cbu5ROZkBHKnnXsjSUw@mail.gmail.com>
 <20200629140738.7dd4749d@windsurf>
 <b3cda0d9-b347-09ce-8b45-4ed29b500e48@railnova.eu>
Message-ID: <20200629204710.5e65167d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Jun 2020 17:30:49 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Generally speaking, pkg-stats does 2 different things:
> 
> 1. Collect information about the packages in the Buildroot tree 
> (version, number of patches, developers, ...). This information changes 
> with the Buildroot tree, and is therefore *STATIC* for a given version 
> of Buildroot.
> 
> 2. Matching the packages against CVEs and release-monitoring. This 
> information is *DYNAMIC* and can change anytime, because it is based on 
> services that are independent of Buildroot.

True.

> Therefore, we could split this process in two distinct parts:
> 
> First, collecting the packages information into a static JSON file (or 
> any other format you like), like some kind of "manifest". This could be 
> done once for each release of Buildroot, and in a nightly job for 
> master/next/<whatever dev branch>. Maybe we could even reuse (some parts 
> of) `make show-info` for that purpose ?
> 
> Secondly, check the CVEs and new pkg versions using as input the static 
> "manifest" file obtained above. This could be done in a nightly job for 
> all the active releases of Buildroot (latest LTS and "regular" release, 
> master, next, ...).

I hadn't thought of it this way.

> This would provide the following advantages:
> 
> - No need to have a full BR tree to generate the CVEs/outdated packages 
> list (only the "manifest") => easier to run for multiple BR versions and 
> to run in parallel

Is this really a relevant advantage ?

> - The "manifest" can be stripped down to the list of packages used in a 
> particular BR config, such as to customize the pkg-stat output to what 
> is relevant to the user (what your colleague Gregory is working on if I 
> understand correctly ?)

The tooling Gr?gory is doing is using the "make show-info" output as an
input to know what packages are enabled (and their version, ignored
CVEs, etc.) and does a match against the NVD database. The code doing
the match against the NVD database is factored out from the pkg-stats
script so that it is shared.

> - This makes it easier to plug a frontend (like the one Heiko was 
> working on) describing the packages available in a certain BR release, 
> and optionally the daily regenerated stats of these packages.

Well, the frontend from Heiko also needs the dynamic information
(release-monitoring, NVD) and so from that perspective splitting out
the "static" info from the "dynamic" info.

All in all, I don't know. Perhaps it could be useful, but the few
arguments to my eyes don't really bring any new really useful great
feature.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
