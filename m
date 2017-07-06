From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 5 Jul 2017 17:04:48 -0700
Subject: [Buildroot] [PATCH] package/libglib2: add missing dependency on
	host-python[3]
In-Reply-To: <ec246461-b4fe-b71b-1899-fd9a43fbb1e3@mind.be>
References: <20170705003038.5318-1-andrew.smirnov@gmail.com>
 <ec246461-b4fe-b71b-1899-fd9a43fbb1e3@mind.be>
Message-ID: <CAHQ1cqEV0Exj6oNa2rQef+R-71cpq_EgpMW4mBc4CMTY5CVCGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 4, 2017 at 5:36 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 05-07-17 02:30, Andrey Smirnov wrote:
>> Building gio/gdbus-2.0/codegen/ subdirectory requires host to have a
>> python interpreter. Add 'host-python'/'host-python3' as a dependency
>> to reflect that fact and prevent build failures.
>
>  Do you have an actual build failure for this? We already require a python to be
> present on the host, so there shouldn't be a need to build one here. And we
> really do want to avoid that libglib2 pulls in host-python (to limit the build
> time).

It's a corner case involving partial rebuilds, so maybe not worth
trying to fix, but it can be reproduced in configuration that pulls
in/builds some flavor of "host-python" _before_ "host-libglib2" by
doing:

find ${BUILD_DIR} -name ".stamp_host_installed" | xargs rm -f
rm -rf ${HOST_DIR}
make host-libglib2-install

what happens is host-libglib2's ./configure picks up python from PATH,
which if built after host-python, ends up being python from
${HOST_DIR}, but since host-libglib2 doesn't reference host-python as
a dependency re-executing "host-libglib2-install" ends up in failure.

Another option to handle this would be to explicitly specify which
python to use with --with-python when configuring libglib2.

Thanks,
Andrey Smirnov
