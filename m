From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Jan 2018 13:04:03 +0100
Subject: [Buildroot] [PATCH v2 01/13] pkg-{download,
 generic}: remove source-check
In-Reply-To: <20180108212827.4d876213@windsurf>
References: <20171025201003.16105-1-ps.report@gmx.net>
 <20171025201003.16105-2-ps.report@gmx.net>
 <20180108212827.4d876213@windsurf>
Message-ID: <CAAXf6LXwWBpJeosSW=B5J50f_aVO8OUvCD7E8F9M_GgSOcta-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


2018-01-08 21:28 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed, 25 Oct 2017 22:09:51 +0200, Peter Seiderer wrote:
>> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>>
>> This feature is not used by anyone in the core developpers and makes a
>> drastic simplification of the pkg-download infrastructure harder.
>>
>> The future patch will move much of what's in the current pkg-download.mk
>> file into the dl-wrapper which is a shell script.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>> Changes v1 --> v2:
>>  - from https://github.com/maximeh/buildroot/commit/a4d0e83729a1ab534ff99d6f258058a1be1ed949.patch
>>  - remove more references to source-check (suggested by Thomas Petazzoni)
>> ---
>>  Makefile                |  7 +------
>>  package/pkg-download.mk | 44 --------------------------------------------
>>  package/pkg-generic.mk  | 14 +-------------
>>  3 files changed, 2 insertions(+), 63 deletions(-)
>
> Applied to master, thanks.
>

I saw this on the agenda of the FOSDEM developer days, so thought it
would be discussed there before going forward with applying this. I
should have expressed my concerns on the patch immediately, sorry.

In fact, just recently I did start using 'make source-check' in our
environment. There are two use cases:
1. Our Buildroot tree contains a few packages with in-house source
code. They are typically Mercurial repositories. A developer changing
code in such a repository is expected to push to that repository and
then update the revision hash in the Buildroot .mk file (or if it
concerns a Linux/Uboot tree in the defconfig file).
Now, it sometimes happens that people update the hash but forget to
push the corresponding changes to the package's repository. This is of
course human error. In our delivery system (where people don't push
directly to the main repo but rather to some staging area where
changes are first automatically validated), it would be caught by
making a build, but this takes quite some time, order of 1 hour (we
have many defconfigs). Hence, we added an initial check to our
delivery system that just performs 'make source-check' for all
defconfigs. This only takes a few minutes. Deliveries that fail the
check are thus rejected very quickly and no computing resources are
lost.

2. Besides the in-house repositories, there is a use case even for
normal open-source packages. We have an internal BR2_PRIMARY_SITE set
up, that avoids package downloads over the internet. As we need to
guarantee reproducibility over a long time span, we cannot rely on
external sources and we need to mirror all packages used to that
primary site. Developers that enable new packages (or bump one) are
expected to upload the new sources to the primary site, but again may
forget to do so.
Again, this would be caught by the build step that takes ~1 hour,
while the source-check target would detect it in minutes.

Doing a 'make source' rather than 'make source-check' is an
alternative, but it takes longer and consumes much more network
bandwidth.

I would therefore like to find a way to reintroduce 'make
source-check', but of course taking into account the reasons of
removing it in the first place. Perhaps another implementation can be
found using the dl-wrapper.

Thoughts?

Thanks,
Thomas
