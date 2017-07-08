From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jul 2017 23:03:57 +0200
Subject: [Buildroot] [PATCH] package/libglib2: add missing dependency on
 host-python[3]
In-Reply-To: <CAHQ1cqEV0Exj6oNa2rQef+R-71cpq_EgpMW4mBc4CMTY5CVCGw@mail.gmail.com>
References: <20170705003038.5318-1-andrew.smirnov@gmail.com>
 <ec246461-b4fe-b71b-1899-fd9a43fbb1e3@mind.be>
 <CAHQ1cqEV0Exj6oNa2rQef+R-71cpq_EgpMW4mBc4CMTY5CVCGw@mail.gmail.com>
Message-ID: <aad6f493-998a-66cc-5772-c0baa3302379@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 02:04, Andrey Smirnov wrote:
> On Tue, Jul 4, 2017 at 5:36 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 05-07-17 02:30, Andrey Smirnov wrote:
>>> Building gio/gdbus-2.0/codegen/ subdirectory requires host to have a
>>> python interpreter. Add 'host-python'/'host-python3' as a dependency
>>> to reflect that fact and prevent build failures.
>>
>>  Do you have an actual build failure for this? We already require a python to be
>> present on the host, so there shouldn't be a need to build one here. And we
>> really do want to avoid that libglib2 pulls in host-python (to limit the build
>> time).
> 
> It's a corner case involving partial rebuilds, so maybe not worth
> trying to fix, but it can be reproduced in configuration that pulls
> in/builds some flavor of "host-python" _before_ "host-libglib2" by
> doing:
> 
> find ${BUILD_DIR} -name ".stamp_host_installed" | xargs rm -f
> rm -rf ${HOST_DIR}
> make host-libglib2-install
> 
> what happens is host-libglib2's ./configure picks up python from PATH,
> which if built after host-python, ends up being python from
> ${HOST_DIR}, but since host-libglib2 doesn't reference host-python as
> a dependency re-executing "host-libglib2-install" ends up in failure.

 We typically solve this by adding a dependency only if BR2_PACKAGE_PYTHON{,3}
is selected. However...


> Another option to handle this would be to explicitly specify which
> python to use with --with-python when configuring libglib2.

 This is a lot more convenient, since the dependency really is not needed. Since
we require both python and which to be in PATH, you can do

--with-python=`which python`

 Can you roll a patch for that? Don't forget to add a brief comment why this is
needed, and a more extensive explanation in the commit log.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
