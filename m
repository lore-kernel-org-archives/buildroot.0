From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Tue, 16 Feb 2021 23:17:19 +0100
Subject: [Buildroot] package/python-pybind: we need to discuss this package
Message-ID: <CAJe0E3eQxAZHAe2DN4Qp9k_0czYGsR639+=bSUaEdyaKm0Keuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear BR developers,

we need to have a discussion about "python-pybind"

The main problem being the package fails to build since it's been upgraded
to v2.6.1. It's currently stuck in *next.*

Pybind is a dual C++11 / Python package.

I introduced this package as python-pybind because I only needed this
aspect of the package at the time, I think introducing it only as a
python-pkg was a mistake:

* some people may need the C++11 side of this package
* it's named "python-pybind" and the current BR naming convention forbids
the cmake side to ever be activated
* and now the python build requires cmake by itself, so we're kind of
screwed

Indeed, if we run python setup.py like we used to, it's now broken because
it misses some files that are installed by the Cmake build.

These are the steps I manually take to cross-compile pybind on my machine
since v2.6.1:

* always run the cmake build first
* never run cmake in a sub folder ("cmake .")
* have the build results installed in $pybind11/pybind11
  -> this creates $pybind11/pybind11/include & $pybind11/pybind11/share
      needed by the setup.py script (current failure)
* run python setup.py normally

Rather than submitting patches, I think we need to talk about it first.

Personally, I don't see any other option than moving the package to a
cmake-package, because the python step needs it. But I don't even know if
we can combine a cmake-package *and* a python-package feature at the same
time. No package does that in BR at the moment.

Another option would be to create a new package "pybind11" for instance,
declared as a cmake-package. But even in that scenario, I am not able to
propose a valid solution. If you followed my path, I need to call "python
setup.py"  where the cmake build results were previously installed. Which
must happen inside the build directory by itself ($(@D)), not towards
staging or target, which I think is against BR conventions.

There might be a third option: when one runs "python setup.py" it actually
calls cmake. But I am not able to pass any of the known cmake arguments in
this scenario (like -DBUILD_DOC=Yes for instance) because they get dropped
out. But I also did not have much time to investigate that option.

It might also be a good idea to rename this package to *pybind11* instead
of *python-pybind*
* it's not a python-only package (well.. that depends on the decisions we
make)
* it's the real name of the package
* it emphasizes the C++11 side of this package

Any thoughts & input appreciated,

yours,

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210216/85007fa3/attachment.html>
