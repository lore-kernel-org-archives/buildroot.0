From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:55 +0200
Subject: [Buildroot] [PATCH 0/25 v7] gendoc infra: make it useable for other
	documents (branch yem/manual)
Message-ID: <cover.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series builds up on top of Samuel previous series, and further
enhances the GENDOC infrastructure to be useable to generate other
documents, and especially documents in br2-external.

The series is articulated as thus:

  - patches 1-3: from Samuel, virtually untouched by me, save for the
    location where the docs are built (patch 1), and the check for
    xsltproc (patch 3);

  - patches 4-13: properly separate our manual defintion from the actual
    infrastructure;

  - patches 14-15: make the gendoc infra behave more like the pkg
    infras, by using hooks rather than extra rules;

  - patch 16: workaround asciidoc deficiency when calling filters;

  - patches 17-18: move and rename 'gendoc' to 'doc-asciidoc';

  - patches 19-20: further tweak the new infra so it looks more like
    other infras: only call pkgdir and pkgname from the frontend macro,
    and use stamp files so we can use $(@D);

  - patches 21-22: add new locations where to get the AsciiDoc config
    files;

  - patch 23: always use UTC when generating the manual;

  - patch 24: allow using doc-asciidoc from br2-external;

  - patch 25: document this new infra in the manual.

Here is an example of using this new infra from a br2-external tree:

    http://ymorin.is-a-geek.org/download/tmp/br.config/
    http://ymorin.is-a-geek.org/download/tmp/br.config/brsh-manual.html


Changes v6 -> v7:
  - restore $$ when calling UPPERCASE  (Thomas DS)
  - clarifications in commit logs  (Samuel, Thomas DS)
  - typoes  (Samuel, Thomas DS)

Changes v5 -> v6:
  - change build location  (Thomas P.)
  - xsltproc check is a warniong only  (Thomas DS.)
  - do not use unnecessary $$(call)s  (Thomas DS.)
  - rename hooks  (Thomas DS.)
  - comment tricky code sections  (Thomas DS.)
  - more s/manual/document/  (Thomas DS., Samuel)
  - typoes  (Thomas DS., Samuel)

Changes v4 -> v5:
  - cleanup the series
  - make it posible to use $(@D) in hooks
  - call post-extract hook in the same rule that does the rsync
  - rename the extra check dependencies hooks, to look more like real hooks
  - document the doc-asciidoc infra in the manual

Changes v3 -> v4:
  - only run the xsltproc check once, not for every types of outputs
  - add patches 5..18


Regards,
Yann E. MORIN.


The following changes since commit 7b6304af9d69d44ee3040c00b0670f19c02de7d2:

  protobuf: bump version to 2.6.0 (2014-10-02 22:54:37 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/manual

for you to fetch changes up to dda88aca0a62478ffc5be7e7fd9635376be4e3a8:

  docs/manual: document the asciidoc infra (2014-10-02 23:48:13 +0200)

----------------------------------------------------------------
Samuel Martin (3):
      gendoc infra: move manual build location into $(BUILD_DIR)/docs/manual
      gendoc infra: avoid a2x warning
      gendoc infra: disable pdf manual generation if xsltproc is buggy

Yann E. MORIN (22):
      docs/manual: get rid of legacy comment in GENDOC
      docs/manual: copying the manual sources is a common action
      docs/manual: simplify generation dependencies
      docs/manual: manual-update-lists is not a generic GENDOC rule
      docs/manual: move manual-prepare-sources rule into GENDOC
      docs/manual: do not hardcode name of the generated document
      docs/manual: allow a document to declare where its resources are
      docs/manual: last pass at removing hard-coded path in GENDOC_INNER
      docs/manual: properly separate rules specific for our manual
      docs/manual: rename the generic dependency rules
      docs/manual: allow documents to define some hooks, as for a package
      docs/manual: use the new hooks instead of gendoc rules
      docs/manual: always look for resources in destination directory
      docs: separate the GENDOC infra from our manual definition
      docs: rename the GENDOC infrastructure
      docs/asciidoc: call $(pkgname) and $(pkgdir) in a single place
      docs/asciidoc: make it possible to use $(@D) in hooks
      doc/asciidoc: allow documents to pass a global asciidoc configuration
      doc/asciidoc: always apply Buildroot's AsciiDoc config
      doc/asciidoc: always use UTC
      Makefile: enable generating documents from br2-external
      docs/manual: document the asciidoc infra

 Makefile                                 |   2 +
 docs/{manual => conf}/asciidoc-text.conf |   0
 docs/manual/adding-packages-asciidoc.txt | 119 ++++++++++++++++++++
 docs/manual/adding-packages.txt          |   2 +
 docs/manual/manual.mk                    | 107 +++---------------
 package/doc-asciidoc.mk                  | 185 +++++++++++++++++++++++++++++++
 6 files changed, 326 insertions(+), 89 deletions(-)
 rename docs/{manual => conf}/asciidoc-text.conf (100%)
 create mode 100644 docs/manual/adding-packages-asciidoc.txt
 create mode 100644 package/doc-asciidoc.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
