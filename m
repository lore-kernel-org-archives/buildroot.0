From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 29 Jun 2020 17:30:49 +0200
Subject: [Buildroot] [PATCH=2020.02.x] package/redis: bump version to
 5.0.9
In-Reply-To: <20200629140738.7dd4749d@windsurf>
References: <20200621213921.11923-1-peter@korsgaard.com>
 <8cb0702e-2c5d-553b-5793-681ddc619130@railnova.eu>
 <CAAXf6LWhoLwig3i8FNjC3OQ65h27y50cbu5ROZkBHKnnXsjSUw@mail.gmail.com>
 <20200629140738.7dd4749d@windsurf>
Message-ID: <b3cda0d9-b347-09ce-8b45-4ed29b500e48@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and Thomas,

On 29/06/20 14:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 29 Jun 2020 12:51:02 +0200
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> 
>> Which reminds me of the fact that the package stats and associated CVE
>> detection is currently only running on the master branch (that I know of).
>> Which means that we are missing the CVE detection on the LTS branch.
>> Does it take a lot of resources / Is it hard to do, enabling this on the
>> LTS branch too (mostly the CVE part) ?
> 
> Running pkg-stats on other branches is really easy, I can make it
> generate autobuild.buildroot/stats/2020.02.x.{html,json} for example.
> 
> However, what needs a bit more effort is to modify the e-mail
> notification script to make use of that.
> 
> Note that my colleague Gr?gory is working on improving the CVE
> infrastructure so that you can run a script on your specific Buildroot
> version and configuration, and get the list of CVEs you are affected
> by. I.e the same results as pkg-stats, but really tailored to your
> Buildroot version/configuration. Hopefully Gr?gory will send the
> patches soon.

Generally speaking, pkg-stats does 2 different things:

1. Collect information about the packages in the Buildroot tree 
(version, number of patches, developers, ...). This information changes 
with the Buildroot tree, and is therefore *STATIC* for a given version 
of Buildroot.

2. Matching the packages against CVEs and release-monitoring. This 
information is *DYNAMIC* and can change anytime, because it is based on 
services that are independent of Buildroot.


Therefore, we could split this process in two distinct parts:

First, collecting the packages information into a static JSON file (or 
any other format you like), like some kind of "manifest". This could be 
done once for each release of Buildroot, and in a nightly job for 
master/next/<whatever dev branch>. Maybe we could even reuse (some parts 
of) `make show-info` for that purpose ?

Secondly, check the CVEs and new pkg versions using as input the static 
"manifest" file obtained above. This could be done in a nightly job for 
all the active releases of Buildroot (latest LTS and "regular" release, 
master, next, ...).


This would provide the following advantages:

- No need to have a full BR tree to generate the CVEs/outdated packages 
list (only the "manifest") => easier to run for multiple BR versions and 
to run in parallel

- The "manifest" can be stripped down to the list of packages used in a 
particular BR config, such as to customize the pkg-stat output to what 
is relevant to the user (what your colleague Gregory is working on if I 
understand correctly ?)

- This makes it easier to plug a frontend (like the one Heiko was 
working on) describing the packages available in a certain BR release, 
and optionally the daily regenerated stats of these packages.

- This would slightly reduce the runtime of pkg-stat (a non-negligeable 
part is spent collecting pkg data).


Kind regards,

Titouan
