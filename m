From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:23:41 +0100
Subject: [Buildroot] [PATCH] docker-compose: add patch to allow recent
 2.x releases of python-requests
In-Reply-To: <20181215152559.30518-1-peter@korsgaard.com>
References: <20181215152559.30518-1-peter@korsgaard.com>
Message-ID: <20181216122341.7f31297a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 16:25:59 +0100, Peter Korsgaard wrote:
> setup.py explicitly listed a maximum allowed version of python-requests,
> causing runtime failures with the python-requests version we have:
> 
> Loaded image: docker-enp.bin.cloud.barco.com/eis/baseos-docker-snmp:0.1.0
> Traceback (most recent call last):
>   File "/usr/bin/docker-compose", line 6, in <module>
>     from pkg_resources import load_entry_point
>   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3123, in <module>
>   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3107, in _call_aside
>   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3136, in _initialize_master_working_set
>   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 580, in _build_master
>   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 593, in _build_from_requirements
>   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 781, in resolve
> pkg_resources.DistributionNotFound: The 'requests!=2.11.0,!=2.12.2,!=2.18.0,<2.19,>=2.6.1' distribution was not found and is required by docker-compose
> FAIL
> 
> Upstream regularly updates setup.py as new python-requests releases are
> made, but it is unknown why new python-requests releases (which are supposed
> to be backwards compatible) should not be allowed right away.
> 
> Add a path submitted upstream to only disallow new major versions, similar
> to how the other dependencies are handled.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...py-allow-all-recent-2.x-requests-releases.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch

Applied to master, thanks. Maybe there should be a runtime test for
this in our runtime testing infrastrucure ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
