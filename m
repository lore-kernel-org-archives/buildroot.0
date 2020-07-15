From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:36:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: use a shell
 expansion for sysconfigdata_name
In-Reply-To: <20200605205920.465052-1-aduskett@gmail.com> (aduskett's message
 of "Fri, 5 Jun 2020 13:59:20 -0700")
References: <20200605205920.465052-1-aduskett@gmail.com>
Message-ID: <87y2nkzi2f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Currently, GNU Make expands the Python SYSCONFIGDATA_NAME variable; however,
 > when building with per-package directories, this variable is not set because
 > the evaluation of this variable occurs before buildroot creates the
 > per-package directories of a given package.

 > There are two solutions to fix this problem:
 > - Add a step between "patch" and "configure," which would evaluate all of the
 >   variables after creating the per-package directories.

 > - Evaluate SYSCONFIGDATA_NAME via a shell expansion instead of GNU Make.

 > As the second option is more expedient, the second option is what this commit
 > impliments.

 > Remove the current PKG_PYTHON_SYSCONFIGDATA_NAME definition and replace it
 > with the following:

 > PKG_PYTHON_SYSCONFIGDATA_PATH:
 >   - This variable is used to make the next line easier to read.

 > PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] &&
 > basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`

 >   - The "-e" check ensures the path exists, as the basename command only
 >     evaluates strings.

 >   - The "|| true" is added to ensure the old behavior of returning an empty
 >     string if the file does not exist still works.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12941
 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
