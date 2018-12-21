From: Andreas Naumann <dev@andin.de>
Date: Fri, 21 Dec 2018 10:46:15 +0100
Subject: [Buildroot] [PATCH 0/2] core/sdk: fix relative symlinks in
 generated tarball (branch yem/sdk)
In-Reply-To: <cover.1544206190.git.yann.morin.1998@free.fr>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
Message-ID: <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Joel,


Am 07.12.18 um 19:10 schrieb Yann E. MORIN:
> Hello All!
> 
> This two-patch series is my counter-proposal to Joel's path to try and
> fix the issue:
>      https://patchwork.ozlabs.org/patch/1009168/
> 
> The first patch fixes the absolute symlinks, that were so far not
> accounted for at all. A new helper scripts changes them into relative
> symlinks.
> 
> The second patch is the actual fix to the issue Joel's patch was trying
> to solve. I believe it is a better and simpler solution, although I have
> to admit the patsubst trickery is not obvious.

Thank you for these patches as they adress an SDK issue I have just found.
I have applied them on top of 2018.11 and verified the link ./usr -> ./ 
remains as is and is not changed into a dead link to 
./arm-buildroot-linux-gnueabihf_sdk-buildroot/.

However, the check for symlinks pointing out of host/ showed to two 
issues originating in install steps of iptables and eudev. Both create 
links that point to system pathes.

I have locally made POST_STAGING_HOOKS to fix that but that's probably a 
non acceptable hack.


Regards,
Andreas


> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit acb89c8d93952468fc9e24c7ddd9e361b8108e07
> 
>    .gitlab-ci.yml: regenerate after prosody tests addition (2018-12-06 23:15:20 +0100)
> 
> 
> are available in the git repository at:
> 
>    git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to 6ce3997e4824d41b50e13b8554e9f7e59e63a8af
> 
>    core/sdk: don't mangle symlinks with '.' or '..' at start (2018-12-07 18:59:41 +0100)
> 
> 
> ----------------------------------------------------------------
> Joel Carlson (1):
>        core/sdk: don't mangle symlinks with '.' or '..' at start
> 
> Yann E. MORIN (1):
>        core: make symlinks relative when preparing the SDK
> 
>   Makefile                     |  5 +++--
>   support/scripts/fix-symlinks | 53 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 56 insertions(+), 2 deletions(-)
>   create mode 100755 support/scripts/fix-symlinks
> 
