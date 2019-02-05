From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Feb 2019 11:03:46 +0100
Subject: [Buildroot] [PATCH v5 07/10] testing/tests/download: test git
 submodules
In-Reply-To: <20180512025833.22998-8-ricardo.martincoski@gmail.com>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
 <20180512025833.22998-8-ricardo.martincoski@gmail.com>
Message-ID: <76826781-d9bf-2733-c7b7-d2064f070677@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/05/2018 04:58, Ricardo Martincoski wrote:
> +################################################################################
> +#
> +# git-submodule-enabled
> +#
> +################################################################################
> +
> +GIT_SUBMODULE_ENABLED_VERSION = a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f
> +GIT_SUBMODULE_ENABLED_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
> +GIT_SUBMODULE_ENABLED_GIT_SUBMODULES = YES
> +GIT_SUBMODULE_ENABLED_LICENSE_FILES = \
> +	file \
> +	refs-sub1/file \
> +	refs-sub1/refs-sub2/file
> +
> +# Some versions of git client fill the .git file for the second level submodule
> +# using the absolute path to the main .git directory, which in the case of the
> +# buildroot download helper is always different since it uses a temporary
> +# directory. This version of git have the issue:
> +# - 2.7.4 included in Ubuntu 16.04;
> +# The same does not occur using newer versions of git:
> +# - 2.11.0 included in Debian 9;
> +# - 2.14.2 latest at the time of writing;
> +# In order to allow running this test case locally in many systems, do not check
> +# for the hash of the tarball, but instead check the hash of each meaningful
> +# file included in the tarball.

 This is a bug! Funny that we never hit it in the autobuilders, don't we have an
Ubuntu 16.04 autobuilder and don't we have packages with submodules and a hash?

 Anyway, I think maybe we should fix the bug first... Ideally there should be a
test case for it as well, but that's difficult since it depends on the installed
git version.

 Yann, how about if we change the find command in the git helper to

find . -name .git -prune -o -print

?

 Regards,
 Arnout

> +BR_NO_CHECK_HASH_FOR += $(GIT_SUBMODULE_ENABLED_SOURCE)
> +
> +$(eval $(generic-package))
