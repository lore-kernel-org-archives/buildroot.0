From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:25:35 +0200
Subject: [Buildroot] [PATCH] python3: remove target Python packages from
 PYTHONPATH
In-Reply-To: <20170819211150.32340-1-thomas.petazzoni@free-electrons.com>
References: <20170819211150.32340-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170821232535.6ed70c51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Aug 2017 23:11:50 +0200, Thomas Petazzoni wrote:
> This commit is similar to 350941e31de5b454cad75abe5fb0d3db027bc1a7
> ("python: remove target Python packages from PYTHONPATH") but for
> python3.
> 
> We currently have
> $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
> inside the PYTHON3_PATH variable, which gets used to define
> PYTHONPATH, passed to the host Python interpreter when
> building/installing target packages.
> 
> However, this is terribly wrong, as it causes the host interpreter to
> potentially import target Python packages. This is wrong for several
> reasons:
> 
>  - Some Python packages might need some Python modules to be installed
>    on the host (described in setup_requires in setup.py), but their
>    installation currently works because by luck the corresponding
>    Python module is installed for the target. Some of those cases were
>    happening for real, and fixed by previous patches.
> 
>  - Some Python packages include some native code, therefore built for
>    a specific CPU architecture. When you point the host Python
>    interpreter to native libraries built for the target, you get nice
>    build failures, such as the one affecting the python-cffi related
>    packages.
> 
> This change fixes the following build failures:
> 
>    http://autobuild.buildroot.net/results/9005b89407e46b537a54cac6cc0c69dcac4dc5ea/
>    (python-cryptography)
> 
>    http://autobuild.buildroot.net/results/395682d33d02fdcaa39d3c0326355bd9ea3d6feb/
>    (python-pynacl)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python3/python3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
