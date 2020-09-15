From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:46:51 +0200
Subject: [Buildroot] [PATCH v4 1/2] support/scripts/pycompile: fix .pyc
 original source file paths
In-Reply-To: <20200910083252.7102-2-robin.jarry@6wind.com> (Robin Jarry's
 message of "Thu, 10 Sep 2020 10:32:51 +0200")
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200910083252.7102-1-robin.jarry@6wind.com>
 <20200910083252.7102-2-robin.jarry@6wind.com>
Message-ID: <87o8m6swro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robin" == Robin Jarry <robin.jarry@6wind.com> writes:

 > When generating a .pyc file, the original .py source file path is
 > encoded in it. It is used for various purposes: traceback generation,
 > .pyc file comparison with its .py source, and code inspection.

 > By default, the source path used when invoking compileall is encoded in
 > the .pyc file. Since we use paths relative to TARGET_DIR, we end up with
 > paths that are only valid when relative to '/' encoded in the installed
 > .pyc files on the target.

 > This breaks code inspection at runtime since the original source path
 > will be invalid unless the code is executed from '/'.

 > Unfortunately, compileall cannot be forced to use the proper path. It
 > was not written with cross-compilation usage in mind.

 > Rework the script to call py_compile.compile() directly with pertinent
 > options:

 > - The script now has a new --strip-root argument. This argument is
 >   optional but will always be specified when compiling py files in
 >   buildroot.
 > - All other (non-optional) arguments are folders in which all
 >   "importable" .py files will be compiled to .pyc.
 > - Using --strip-root=$(TARGET_DIR), the future runtime path of each .py
 >   file is computed and encoded into the compiled .pyc.

 > No need to change directory before running the script anymore.

 > The trickery used to handle error reporting was only applicable with
 > compileall. Since we implement our own "compileall", error reporting
 > becomes trivial.

 > Signed-off-by: Julien Floret <julien.floret@6wind.com>
 > Signed-off-by: Robin Jarry <robin.jarry@6wind.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
