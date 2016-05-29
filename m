From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 May 2016 00:33:12 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/helper: don't follow symlinks
 when copying libs to target
In-Reply-To: <20160529211224.GC29556@free.fr>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
 <16dd334fb29148489afa344c652208a4c512f445.1464534979.git.yann.morin.1998@free.fr>
 <CAAXf6LXQ0Ncmh71qb48dS3isFhePWkbpqyvH5ZjFX=isQLVvTg@mail.gmail.com>
 <20160529211224.GC29556@free.fr>
Message-ID: <95e5afb7-0922-92cd-8ef7-7807f833b6f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/29/16 23:12, Yann E. MORIN wrote:
> Thomas DS, All,
> 
> On 2016-05-29 20:54 +0200, Thomas De Schampheleire spake thusly:
[snip]
>> While the trailing slash is indeed a fine solution, it is kind of dirty.
>> I wonder if -H would do the trick too:
> [--SNIP--]
>> It should make sure that only STAGING_DIR is resolved, not any other
>> symbolic link encountered.
> 
> Well, appending a slash is a sure mean to make it sure the target of the
> symlink (if it is a symlink to start with) is entered. I don't see where
> it is dirty.

 I should have realized this before, but: when is $(STAGING_DIR) ever a symlink?
It's defined as $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot and it's explicitly
mkdir'ed in the Makefile. It's not a symlink. $(O)/staging is a symlink, but
that's not what's used here.

 That makes me think there must have been a different reason why Thomas added
the -L. Thomas originally wrote:

  I used -follow just to make sure that STAGING_DIR is entered. It seems
  to work without just because STAGING_DIR happens to be defined with a
  trailing slash, in which case its contents are evaluated anyhow by
  find. I considered this dependency too fragile and wanted it to work
  even if someone optimizes away the trailing slash. Another solution
  would be to add a trailing slash manually as $(STAGING_DIR)/ but -L is
  much cleaner.

Note that there never has been a trailing / in STAGING_DIR.

 Thomas, any idea what is going on here?

 I did a quick try with just removing -L and it seems to work fine.


> 
> Yes, -H does the job, too. But I think it is better that we append a
> slash: it makes it explicit we want to treat it as a directory, not a
> potential symlink.
> 
> However, why would we need to handle the symlink case, to begin with? We
> are controlling the variable passed in this case and it points to a copy
> of the sysroot we did make. I.e. that variable is not provided by the
> user; it is always filled by our infra.

 Yann, did you mean the same thing as I described above?


 Regards,
 Arnout

> 
> Surely, if we really, really, like really-really, want to make it
> explicit we want the directory pointed-to by the symlink, then, we
> should probably do:
> 
>     find $$(readlink -f $(STAGING_DIR)) -name blabla
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
