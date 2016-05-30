From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 30 May 2016 08:58:48 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/helper: don't follow symlinks
 when copying libs to target
In-Reply-To: <95e5afb7-0922-92cd-8ef7-7807f833b6f6@mind.be>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
 <16dd334fb29148489afa344c652208a4c512f445.1464534979.git.yann.morin.1998@free.fr>
 <CAAXf6LXQ0Ncmh71qb48dS3isFhePWkbpqyvH5ZjFX=isQLVvTg@mail.gmail.com>
 <20160529211224.GC29556@free.fr>
 <95e5afb7-0922-92cd-8ef7-7807f833b6f6@mind.be>
Message-ID: <CAAXf6LX3RRscc9VFy-5WGROHCD-qjG=hMzP2R5uXnJQX8JDwQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 30, 2016 at 12:33 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/29/16 23:12, Yann E. MORIN wrote:
>> Thomas DS, All,
>>
>> On 2016-05-29 20:54 +0200, Thomas De Schampheleire spake thusly:
> [snip]
>>> While the trailing slash is indeed a fine solution, it is kind of dirty.
>>> I wonder if -H would do the trick too:
>> [--SNIP--]
>>> It should make sure that only STAGING_DIR is resolved, not any other
>>> symbolic link encountered.
>>
>> Well, appending a slash is a sure mean to make it sure the target of the
>> symlink (if it is a symlink to start with) is entered. I don't see where
>> it is dirty.
>
>  I should have realized this before, but: when is $(STAGING_DIR) ever a symlink?
> It's defined as $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot and it's explicitly
> mkdir'ed in the Makefile. It's not a symlink. $(O)/staging is a symlink, but
> that's not what's used here.
>
>  That makes me think there must have been a different reason why Thomas added
> the -L. Thomas originally wrote:
>
>   I used -follow just to make sure that STAGING_DIR is entered. It seems
>   to work without just because STAGING_DIR happens to be defined with a
>   trailing slash, in which case its contents are evaluated anyhow by
>   find. I considered this dependency too fragile and wanted it to work
>   even if someone optimizes away the trailing slash. Another solution
>   would be to add a trailing slash manually as $(STAGING_DIR)/ but -L is
>   much cleaner.
>
> Note that there never has been a trailing / in STAGING_DIR.
>
>  Thomas, any idea what is going on here?
>

I think the correct term here is 'mass hysteria' :-D

I can imagine where the imagined need comes from: while testing the
necessary commands on the command-line I will have compared
output/target with output/staging, not with
output/host/usr/<tuple>/sysroot. When coding this into Buildroot I did
not consider that STAGING_DIR was not pointing to output/staging
(although I actually know that, of course).

I'm baffled by the statement "It seems to work without just because
STAGING_DIR happens to be defined with a trailing slash". This must
have been derived from the observation that things worked without
-L/-follow and making the assumption that it must have been due to a
trailing slash without actually verifying that.

Anyway, if it works with plain find, all the better.
Sorry for all this confusion.
Let's consider it a good lesson in not making assumptions :-)

Thanks,
Thomas
