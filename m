From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 14:51:50 +0100
Subject: [Buildroot] [PATCH 0/2] Allow host python3 without a target
 python
In-Reply-To: <20180430192359.15733-1-tpiepho@impinj.com>
References: <20180430192359.15733-1-tpiepho@impinj.com>
Message-ID: <678d57c9-bf33-eae5-d760-a5c1b0f2f9e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Trent,

 Thank you for these patches.

On 30/04/2018 21:23, Trent Piepho wrote:
> It's currently not possible to select the default host python to be
> python3 without also turning on target python3.
> 
> There was a previous patch that attemped to resolve this
> https://patchwork.ozlabs.org/patch/854602/ but there were issues.
> 
> This should solve those issues, using the approach I described in
> comment #4.
> 
> This series does not yet hunt down every non-python-package that uses
> host-python to make sure it gets the proper host python version.  I just
> did the packages I needed to test with our project and will wait to see
> if the approach is accepted before working on the remaining packages.

 We discussed this at the BR developer meeting. The problem is, this change is
not very useful if you don't hunt down all the packages that use host-python.
Now, that list is still somewhat reasonable (100-ish). However, remember that
any package that uses host-python through the infra (e.g. meson-package) would
also need to select a python version. We feel that this is going to add too much
to the Config.in files everywhere, and that the potential gains from it are not
worth the effort.

 Specifically for python, there were two cases where the
host-python-if-no-target-python selection was relevant: setuptools and meson.
The setuptools case is already handled through python3-setuptools. For the meson
case, there is a really simple solution: make host-ninja depend on host-python3
instead of host-python. host-ninja is currently *only* directly depended upon by
host-meson, so in practice we *always* need host-python3...

 If there are other cases where we would really like to have a
host-python-2-or-3 config option, it can probably also be worked around on a
case-by-case basis.


 Therefore, these patches are marked as Rejected in patchwork. Thanks for
working on it though, it was still useful!

 Regards,
 Arnout

> 
> Trent Piepho (2):
>   host-python: Select host python version when no target python
>   packages: Use PKG_PYTHON_HOST_PYTHON for host python
> 
>  package/Config.in.host         | 1 +
>  package/gtest/gtest.mk         | 5 ++---
>  package/ninja/ninja.mk         | 3 +--
>  package/pkg-python.mk          | 6 +++++-
>  package/python/python.mk       | 2 +-
>  package/python3/Config.in.host | 8 ++++++++
>  package/python3/python3.mk     | 2 +-
>  7 files changed, 19 insertions(+), 8 deletions(-)
>  create mode 100644 package/python3/Config.in.host
> 
