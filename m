From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:14:04 +0100
Subject: [Buildroot] [PATCH] package/pkg-python: fix for per-package
 directories
In-Reply-To: <20200217235048.107343-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 18 Feb 2020 00:50:47 +0100")
References: <20200217235048.107343-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lfozee6r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > With per-package directory support, Python external modules are
 > causing a problem: the _sysconfigdata.py module installed by the
 > Python interpreter contains a number of paths that are relative to the
 > current package per-package directory, i.e python or python3. For
 > example:

 > 'BLDSHARED': '/home/thomas/projets/buildroot/output/per-package/python/host/bin/arm-linux-gcc -shared',
 > 'CC': '/home/thomas/projets/buildroot/output/per-package/python/host/bin/arm-linux-gcc',
 > 'CXX': '/home/thomas/projets/buildroot/output/per-package/python/host/bin/arm-linux-g++',
 > etc.

 > These paths are problematic, because it means that the wrong compiler
 > gets used when building external Python modules: instead of using the
 > compiler from the external Python module per-package host directory,
 > it uses the one from the 'python' or 'python3' per-package host
 > directory. Due to this, any native dependency needed by the external
 > Python module is not found, even though it is properly present in the
 > current package per-package directory.

 > Of course, the problem occurs with both target Python modules and host
 > Python modules.

 > To fix this, we simply rewrite those paths in _sysconfigdata.py before
 > building a Python package.

 > Interestingly, until now, the _sysconfidata.py that was used during
 > the build was the one from $(TARGET_DIR), which is a bit unusual: it
 > is more common to use files from $(STAGING_DIR) during the build
 > process. So this commit changes the PYTHON_PATH and PYTHON3_PATH
 > variables so that they point to $(STAGING_DIR), which makes the
 > _sysconfigdata.py fixup in $(STAGING_DIR) effective.

 > Fixes:

 >   http://autobuild.buildroot.net/results/a24b0555fd4261b50dc3986635c30717d9cbe764/ (python-psycopg2)
 >   http://autobuild.buildroot.net/results/080fa893e1b0e7a8c8a31ac1c98eb8871b97264d/ (python-alsaaudio)
 >   http://autobuild.buildroot.net/results/79bc070f98d6d9d8ef78df12b248cdc7d0e405c3/ (python-lxml)
 >   and many more Python packages that use native code with a native library

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
