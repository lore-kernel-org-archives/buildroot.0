From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 10:04:33 +0200
Subject: [Buildroot] [PATCH] core: make it possible to check flake8 like
 we check package
In-Reply-To: <20190519164417.20124-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 19 May 2019 18:44:17 +0200")
References: <20190519164417.20124-1-yann.morin.1998@free.fr>
Message-ID: <87ftp4qnvy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Move the code to run check-flake8 into the Makefile, like we
 > have for check-package, so that it is easy to run locally (and
 > not wait for someone to report a failure from their Gitlab
 > pipelines).

 > Since there is no "post-rule" in Makefiles, we resort to using
 > a little trick to remove the temporary file. Also, there is a
 > slight change in behaviour: the list of files is not reported,
 > and the number of processed files is not reported either (there
 > is little value in that; all that is important are the errors,
 > if any).

 > Regenerate .gitlab-ci.yml.

..
 
 > +check-flake8:
 > +	{ find * -type f -name '*.py'; \
 > +	  find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1; \
 > +	} >files.txt
 > +	$(Q)python -m flake8 --statistics --count --max-line-length=132 \
 > +		$$(sort -u files.txt; rm -f files.txt)
 > +

I know we had this already like this, but it would be nice to make the
following improvements:

- Use git ls-tree -r --name-only HEAD instead of find so it doesn't
  check external files in output/build

- No need for 2x find commands, file output for a .py file is presumably
  also 'Python script' (and if not, then it probably isn't a python file)

- A temporary file in the toplevel directory isn't really nice, and it
  doesn't seem to be needed - Why not pipe the list of python scripts to

  sort -u | xargs python -m flake8 ..

-- 
Bye, Peter Korsgaard
