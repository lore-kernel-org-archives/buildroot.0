From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jul 2016 18:11:51 +0200
Subject: [Buildroot] [PATCH] package/qt5webkit: needs host-python
In-Reply-To: <20160726095809.21008ed0@free-electrons.com>
References: <1469486011-29173-1-git-send-email-yann.morin.1998@free.fr>
 <20160726095809.21008ed0@free-electrons.com>
Message-ID: <20160726161151.GA5925@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-26 09:58 +0200, Thomas Petazzoni spake thusly:
> On Tue, 26 Jul 2016 00:33:31 +0200, Yann E. MORIN wrote:
> > The Qt5Webkit build system hard-codes calls to 'python', but only really
> > supports python2.
> > 
> > We fix that similarly as we did in nodejs, by adding a python->python2
> > symlink early in the PATH when configuring/building Qt5Webkit, and
> > adding host-python in the dependency list.
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/results/ea4/ea4dd00ee585f9f9ea1927b8b5fd9035e6733420/
> >     http://autobuild.buildroot.org/results/323/323ba220fae70d94c81bab9a348be844e90ace91/
> >     http://autobuild.buildroot.org/results/6c2/6c20c9e222f94e6b70b97b87e1393dd16da2718c/
> > 
> > Also slightly reorganise the dependency list, now that it no longer fits
> > on a single line.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I know the hack of creating a dummy "bin" directory, with a
> python->python2 symlink is a trick already used by nodejs, but I don't
> like it very much.

Neither do I, but see below...

> Is "python" hardcoded is so many places in Qt5Webkit ?

    $ grep -r -E '(^|[[:space:]])python([[:space:]]|$)' |grep -v ChangeLog |wc -l
    153

A lot of them are just doc or such, but there are still a lot of places
that are indeed calls to the python interpreter:

    Tools/gtk/jhbuildrc:#!/usr/bin/env python
    Tools/gtk/common.py:#!/usr/bin/env python
    Tools/gtk/generate-gtkdoc:#!/usr/bin/env python
    Tools/gtk/generate-feature-defines-files:#!/usr/bin/env python
    Tools/CygwinDownloader/cygwin-downloader.py:#!/usr/bin/env python
    Tools/efl/jhbuildrc:#!/usr/bin/env python
    Tools/efl/common.py:#!/usr/bin/env python
    Tools/BuildSlaveSupport/build.webkit.org-config/committer_auth_unittest.py:#!/usr/bin/env python
    Tools/BuildSlaveSupport/wait-for-SVN-server.py:#!/usr/bin/env python
    Tools/jhbuild/jhbuild-wrapper:#!/usr/bin/env python
    Tools/QueueStatusServer/app.yaml:runtime: python
    Tools/Scripts/new-run-webkit-tests:#!/usr/bin/env python
    Tools/Scripts/validate-committer-lists:#!/usr/bin/env python
    Tools/Scripts/run-qtwebkit-tests:#!/usr/bin/env python
    Tools/Scripts/lint-webkitpy:#!/usr/bin/env python
    Tools/Scripts/generate-win32-export-forwards:#!/usr/bin/env python
    Tools/Scripts/import-w3c-tests:#!/usr/bin/env python
    Tools/Scripts/webkitpy/layout_tests/views/buildbot_results.py:#!/usr/bin/env python
    Tools/Scripts/webkitpy/layout_tests/views/buildbot_results_unittest.py:#!/usr/bin/env python
    [...]
    Source/WebCore/DerivedSources.make:     python $(WebCore)/html/parser/create-html-entity-table -o HTMLEntityTable.cpp $(WebCore)/html/parser/HTMLEntityNames.in
    Source/WebCore/DerivedSources.make:     python $(WebCore)/inspector/generate-inspector-protocol-version -o InspectorProtocolVersion.h $(WebCore)/inspector/Inspector.json
    Source/WebCore/DerivedSources.make:     python $(WebCore)/inspector/CodeGeneratorInspector.py $(WebCore)/inspector/Inspector.json --output_h_dir . --output_cpp_dir .
    Source/WebCore/html/parser/create-html-entity-table:#!/usr/bin/env python
    Source/JavaScriptCore/DerivedSources.pri:retgen.commands = python $$retgen.script > ${QMAKE_FILE_OUT}
    Source/JavaScriptCore/DerivedSources.pri:klgen.commands = python $$klgen.script ${QMAKE_FILE_NAME} > ${QMAKE_FILE_OUT}
    Source/JavaScriptCore/DerivedSources.pri:    disassembler.commands = python $$disassembler.script ${QMAKE_FILE_NAME} --outputDir ${QMAKE_FUNC_FILE_OUT_PATH}
    Source/JavaScriptCore/DerivedSources.make:      python $^ > $@
    Source/JavaScriptCore/DerivedSources.make:      python $^ > $@
    Source/JavaScriptCore/DerivedSources.make:      (PYTHONPATH=$(JavaScriptCore)/disassembler/udis86 python $(JavaScriptCore)/disassembler/udis86/itab.py $(JavaScriptCore)/disassembler/udis86/optable.xml || exit 1)
    [...]

So, I'm not gonna patch it either...

> If not, what
> about patching it instead, and submitting the patch upstream (though
> I'm not sure qtwebkit is still maintained, since they moved to
> qtwebengine I believe).

Yes, upstream is not maintaining it anymore, but it's still being
maintained by "the community", and they are now even compatible with
Qt-5.7.

See also the commit log of e8dbdbd (qt5webkit: restore package). ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
