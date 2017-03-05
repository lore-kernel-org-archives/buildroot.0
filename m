From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:25:16 +0100
Subject: [Buildroot] [PATCH v3] Add gitlab-CI support
In-Reply-To: <20170213232303.7053-1-arnout@mind.be>
References: <20170213232303.7053-1-arnout@mind.be>
Message-ID: <20170305222516.78689464@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 00:23:03 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The buildroot repository is now mirrored on
> https://gitlab.com/buildroot.org/buildroot so we can use Gitlab-CI to
> test Buildroot. Gitlab-CI is controlled by a .gitlab-ci.yml file
> that exists in the repository.

I've applied with some minor changes (see below).

> Building all the defconfigs takes a long time. Gitlab-CI will do that
> every time it pulls from git.buildroot.org, which is once per hour.
> That is way too often. Therefore, the defconfigs are not built on pull,
> but only on explicit trigger through the API or when a tag is added.

What is the next step now? Who is going to run in a cronjob the thing
that triggers the build? Can we setup a notification on the mailing
list and/or IRC when there is a failure?

> +    # The container has not package lists, so need to update first

I've fixed the typo not -> no, as noticed by Marcus.

> +.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig
> +	(cd configs; ls -1 *_defconfig) | sed 's/$$/: *defconfig/' | cat $< - > $@

I've added LC_ALL=C when calling ls -1, because I did not had the same
order as yours when regenerating the list of defconfigs. Apparently,
depending on the locales armadeus is before or after arm_.

And I've regenerated the list of defconfigs before pushing, of course.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
