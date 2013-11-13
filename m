From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Nov 2013 12:50:09 +0100
Subject: [Buildroot] [PATCH] infra: introduce github helper function
In-Reply-To: <1384340676-13106-1-git-send-email-mjonker@synopsys.com>
References: <1384340676-13106-1-git-send-email-mjonker@synopsys.com>
Message-ID: <52836771.5010303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/13 12:04, Mischa Jonker wrote:
> In order to make it easier to cope with changes in github download-URL's,
> this patch introduces the github helper function. It generates the site
> URL of a github repository. It's usage is $(call github,user,pkg,version).
>
> Cc: Arnout Vandecapelle <arnout@mind.be>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>


  There is one that is wrong: input-event-daemon; with that fixed, it 
gets my:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Tested by re-downloading all these and comparing the source trees with 
the original (at least for some of them).


  I have a few more comments but with the input-event-daemon fix the 
patch can be applied as is.

> ---
[snip]
>   42 files changed, 46 insertions(+), 42 deletions(-)

  There are a few more places that could be adapted:

- the defconfigs - yes, it is possible to $(call github,...) in a .config 
file. Some of them are still using git URLs.

- cpanminus (still using the archive URL)

- cppzmq (still using git method)

- czmq (still using git method)

- filemq (still using git method)

- jquery-keyboard (still using archive URL)

- json-javascript (still using git method)

- lcdapi

- lua-msgpack-native

- luaposix (still using archive URL)

- ne10

- qtuio (still using git method)

- sconeserver (still using git method)

- ti-utils

- tvheadend (still using git method)

- zmqpp (still using git method)

- zyre (still using git method)


>
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 00244fe..73c25be 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -41,11 +41,12 @@ How to add a package from github
>
>   Packages on github often don't have a download area with release tarballs.
>   However, it is possible to download tarballs directly from the repository
> -on github.
> +on github. As github is known to have changed download mechanisms in the
> +past, the 'github' helper function should be used as shown below.
>
>   ------------------------
>   FOO_VERSION = v1.0 # tag or full commit ID
> -FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
> +FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
>   ------------------------

  Somewhere else in the documentation, there is still a reference to 
github to explain the git method. That should really be removed. But 
that's actually a separate issue.


  Regards,
  Arnout

>
>   .Notes

[snip]



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
