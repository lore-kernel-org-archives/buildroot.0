From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 13:07:53 +0200
Subject: [Buildroot] [PATCH 0/23 v5] gendoc infra: make it useable for other
	documents (branch yem/manual)
Message-ID: <cover.1410692670.git.yann.morin.1998@free.fr>
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

  - patches 1-4 from Samuel, virtually untouched by me, save for the
    check for xsltproc, see the changelog in patch 4;

  - then, patches 5-16 to remove hard-coded reference to 'manual'
    in either GENDOC or GENDOC_INNER, and to remove hard-coded paths to
    our manual, and to properly separate GENDOC generic rules from
    document-specific rules, and make GENDOC look more like the
    pkg-XXX infrastructures;

  - finally, patches 17-18 allow building document from br2-external.

There are a few shortcomings here and there, be sure to read the
post-commit notes.


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


The following changes since commit 52fac6a2f7bba55fb78a7a1354eef7be5bba9f78:

  libelf: Removes the package (2014-09-14 00:11:20 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/manual

for you to fetch changes up to cace268e0a2d0419476bc7c1952f753857a863a3:

  docs/manual: document the asciidoc infra (2014-09-14 11:33:34 +0200)

----------------------------------------------------------------
Samuel Martin (4):
      gendoc infra: cosmetic fixes
      gendoc infra: move manual build location into $(BUILD_DIR)/manual
      gendoc infra: avoid a2x warning
      gendoc infra: disable pdf manual generation if xsltproc is buggy

Yann E. MORIN (19):
      docs/manual: get rid of legacy comment in GENDOC
      docs/manual: copying the manual sources is a common action
      docs/manual: simplify generation dependencies
      docs/manual: manual-update-lists is not a generic GENDOC rule
      docs/manual: move manual-prepare-sources rule into GENDOC
      docs/manual: do not hardcode name of the generated document
      docs/manual: allow a document to declare where its ressources are
      docs/manual: last pass at removing hard-coded path in GENDOC_INNER
      docs/manual: properly separate rules specific for our manual
      docs/manual: rename the generic dependency rules
      docs/manual: allow documents to define some hooks, as for a package
      docs/manual: use the new hooks instead of gendoc rules
      docs/manual: always look for ressources in destination directory
      docs: separate the GENDOC infra from our manual definition
      docs: rename the GENDOC infrastructure
      docs/asciidoc: call $(pkgname) and $(pkgdir) in a single place
      docs/asciidoc: make it possible to use $(@D) in hooks
      Makefile: enable generating documents from br2-external
      docs/manual: document the asciidoc infra

 Makefile                                 |   2 +
 docs/manual/adding-packages-asciidoc.txt | 118 +++++++++++++++++++++++
 docs/manual/adding-packages.txt          |   2 +
 docs/manual/manual.mk                    | 104 ++++-----------------
 package/doc-asciidoc.mk                  | 156 +++++++++++++++++++++++++++++++
 5 files changed, 294 insertions(+), 88 deletions(-)
 create mode 100644 docs/manual/adding-packages-asciidoc.txt
 create mode 100644 package/doc-asciidoc.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
