From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 8 Jan 2014 08:54:37 +0100
Subject: [Buildroot] [RFC PATCH 0/2] gitorious helper
In-Reply-To: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <CAAXf6LWy3cXCxTLZcPo+pgXeHjNwc2+uVGyJZZLYJ8RP2rCFHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,


On Wed, Dec 25, 2013 at 5:18 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> The following patches introduce a gitroious helper to download tarballs for
> gitorious. I currently see two shortcomings:
>  - the tarball URL is https://gitorious.org/<project>/<repo>/archive/<version>.tar.gz
>    so the downloaded tarball doesn't have any name appart from <version>.tar.gz

This is indeed a pity. Not only because it makes the helper more
complex, but also because the dl/ directory will contain a 'magic'
file called <version>.tar.gz; the package it belongs to is not clear
to the user.

I propose two alternatives:
1. discuss the situation with the Gitorious people, requesting them to
provide a downloadable tarball with the name
<package>-<version>.tar.gz (or whichever extension), like the rest of
the software world does.

2. accept the fact that the URL cannot be changed, but modify the wget
download helper so that it can rename the file after download
(clarifying the list of files in dl/)

In the first alternative, the gitorious helper can be a one-liner just
as for github, and the .mk files only need to specify FOO_SITE.
In the second alternative, we need to set two variables FOO_SITE and
FOO_SOURCE. In your current patchset, you have done this with one
helper that sets both variables. As a result, the usage compared to
the github helper is fundamentally different.
For github:
FOO_SITE = $(call github,username,package,$(FOO_VERSION))
while for gitorious:
$(call gitorious,username,package,$(FOO_VERSION)

I don't like this difference, and suggest two alternatives:
A. split the helper in two, so that:
FOO_SITE = $(call gitorious-site,username,package,$(FOO_VERSION))
FOO_SOURCE = $(call gitorious-version,username,package,$(FOO_VERSION))

This is then equivalent to github except the new FOO_SOURCE, which is
simply not present for github (at the moment).

B. Keep the current gitorious helper, but apply the same strategy to
the github helper, so that its usage also becomes
$(call github,username,package,$(FOO_VERSION))


>  - It needs two separate functions for target and host packages.
>

Can you clarify this?
In package/pkg-generic.mk, if HOST_FOO_VERSION/SOURCE is not defined
and we try to build a host package, its value is taken from
FOO_VERSION/SOURCE. Then why do we need to have a separate helper?

Thanks,
Thomas
