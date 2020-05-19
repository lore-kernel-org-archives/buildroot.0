From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Tue, 19 May 2020 09:28:46 +0200
Subject: [Buildroot] [PATCH 4/8] package/odb: new package
In-Reply-To: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
References: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
Message-ID: <20200519072850.898877-5-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

ODB is an open-source, cross-platform, and cross-database
object-relational
mapping (ORM) system for C++. It allows you to persist C++ objects to a
relational database without having to deal with tables, columns, or SQL
and without manually writing any mapping code.

ODB supports MySQL, SQLite, PostgreSQL, Oracle, and Microsoft SQL Server
relational databases as well as C++98/03 and C++11 language standards.
It also comes with optional profiles for Boost and Qt which allow you to
seamlessly use value types, containers, and smart pointers from these
libraries in your persistent C++ classes.

This package is used for auto-generating ODB specific header files into
useable code that can be linked against a seperate libodb and a specific
libodb database library.  As such, it is only needed as a host program
and is not user selectable.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Kamel: Fix incorrect odb license]
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 DEVELOPERS                                    |   1 +
 package/Config.in.host                        |   1 +
 package/odb/0001-no-need-of-tm.h.patch        |  32 ++
 .../odb/0002-Remove-gratuitous-classes.patch  | 444 ++++++++++++++++++
 ...rk-to-make-ODB-compatible-with-GCC-6.patch | 311 ++++++++++++
 ...e-compilable-with-GCC-6-in-C-14-mode.patch |  47 ++
 ...-in-GCC-6-input_location-translation.patch |  33 ++
 .../odb/0006-Adapt-to-changes-in-GCC-8.patch  | 226 +++++++++
 ...itch-to-C-11-get-rid-of-auto_ptr-use.patch | 350 ++++++++++++++
 ...tion-to-be-compatible-with-previous-.patch |  32 ++
 ...espace-aliases-when-parsing-GCC-tree.patch |  29 ++
 .../0010-Add-initial-support-for-GCC-9.patch  | 232 +++++++++
 package/odb/Config.in.host                    |   7 +
 package/odb/odb.hash                          |   6 +
 package/odb/odb.mk                            |  20 +
 package/odb/series                            |  10 +
 16 files changed, 1781 insertions(+)
 create mode 100644 package/odb/0001-no-need-of-tm.h.patch
 create mode 100644 package/odb/0002-Remove-gratuitous-classes.patch
 create mode 100644 package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
 create mode 100644 package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
 create mode 100644 package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch
 create mode 100644 package/odb/0006-Adapt-to-changes-in-GCC-8.patch
 create mode 100644 package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
 create mode 100644 package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
 create mode 100644 package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
 create mode 100644 package/odb/0010-Add-initial-support-for-GCC-9.patch
 create mode 100644 package/odb/Config.in.host
 create mode 100644 package/odb/odb.hash
 create mode 100644 package/odb/odb.mk
 create mode 100644 package/odb/series

diff --git a/DEVELOPERS b/DEVELOPERS
index e64b90a1aa..66ce95b4e1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -50,6 +50,7 @@ F:	package/libsepol/
 F:	package/libwebsockets/
 F:	package/mender-grubenv/
 F:	package/nginx-naxsi/
+F:	package/odb/
 F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
diff --git a/package/Config.in.host b/package/Config.in.host
index dfea478868..7dc1e46e97 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -81,5 +81,6 @@ menu "Host utilities"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 	source "package/zstd/Config.in.host"
+	source "package/odb/Config.in.host"
 
 endmenu
diff --git a/package/odb/0001-no-need-of-tm.h.patch b/package/odb/0001-no-need-of-tm.h.patch
new file mode 100644
index 0000000000..9f4b7ad498
--- /dev/null
+++ b/package/odb/0001-no-need-of-tm.h.patch
@@ -0,0 +1,32 @@
+From bb4eda4847752b04369afc88fdbb8b43a458be3c Mon Sep 17 00:00:00 2001
+From: Kamel Bouhara <kamel.bouhara@bootlin.com>
+Date: Thu, 14 May 2020 17:31:27 +0200
+Subject: [PATCH 01/10] no need of tm.h
+
+<tm.h> include in gcc.hxx appears to be no longer necessary.
+On MIPS this file pulls in enum processor which conflicts with our class
+processor.
+
+From debsources: https://sources.debian.org/patches/odb/2.4.0-12/no_need_of_tm.h.patch/
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/gcc.hxx | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/odb/gcc.hxx b/odb/gcc.hxx
+index 504b59b..c953047 100644
+--- a/odb/gcc.hxx
++++ b/odb/gcc.hxx
+@@ -46,8 +46,6 @@ extern "C"
+ #include <tree.h>
+ #include <real.h>
+ 
+-#include <tm.h>
+-
+ #include <cpplib.h>
+ #include <cp/cp-tree.h>
+ 
+-- 
+2.25.0
+
diff --git a/package/odb/0002-Remove-gratuitous-classes.patch b/package/odb/0002-Remove-gratuitous-classes.patch
new file mode 100644
index 0000000000..0ae50aa101
--- /dev/null
+++ b/package/odb/0002-Remove-gratuitous-classes.patch
@@ -0,0 +1,444 @@
+From 5486c8c85b9cfb92232518b2fadf6d8ed7b332d5 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Wed, 3 Jun 2015 21:35:43 +0200
+Subject: [PATCH 02/10] Remove gratuitous classes
+
+In the process also get rid of global class processor which conflicts
+with enum processor on MIPS.
+From debsources: https://sources.debian.org/patches/odb/2.4.0-12/remove_gratuitous_classes.patch/
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/context.hxx              |  3 ++-
+ odb/generator.cxx            | 24 ++++++++++++------------
+ odb/generator.hxx            | 26 ++++++++------------------
+ odb/plugin.cxx               | 18 +++++++-----------
+ odb/processor.cxx            |  4 ++--
+ odb/processor.hxx            | 22 ++++++----------------
+ odb/relational/validator.cxx |  6 +++---
+ odb/relational/validator.hxx | 29 +++++++++--------------------
+ odb/validator.cxx            | 13 ++++++-------
+ odb/validator.hxx            | 28 +++++++++-------------------
+ 10 files changed, 64 insertions(+), 109 deletions(-)
+
+diff --git a/odb/context.hxx b/odb/context.hxx
+index 1cf002a..351bc61 100644
+--- a/odb/context.hxx
++++ b/odb/context.hxx
+@@ -41,7 +41,8 @@ typedef cutl::re::format regex_format;
+ 
+ typedef std::vector<regexsub> regex_mapping;
+ 
+-//
++// Generic exception thrown to indicate a failure when diagnostics
++// has already been issued (to stderr).
+ //
+ class operation_failed {};
+ 
+diff --git a/odb/generator.cxx b/odb/generator.cxx
+index e165faf..6aa5151 100644
+--- a/odb/generator.cxx
++++ b/odb/generator.cxx
+@@ -58,7 +58,7 @@ namespace
+     if (!ifs.is_open ())
+     {
+       cerr << "error: unable to open '" << p << "' in read mode" << endl;
+-      throw generator::failed ();
++      throw generator_failed ();
+     }
+   }
+ 
+@@ -70,7 +70,7 @@ namespace
+     if (!ofs.is_open ())
+     {
+       cerr << "error: unable to open '" << p << "' in write mode" << endl;
+-      throw generator::failed ();
++      throw generator_failed ();
+     }
+   }
+ 
+@@ -118,7 +118,7 @@ namespace
+   }
+ }
+ 
+-void generator::
++void
+ generate (options const& ops,
+           features& fts,
+           semantics::unit& unit,
+@@ -259,7 +259,7 @@ generate (options const& ops,
+             cerr << in_log_path << ": error: wrong database '" <<
+               old_changelog->database () << "', expected '" << db <<
+               "'" << endl;
+-            throw generator::failed ();
++            throw generator_failed ();
+           }
+ 
+           string sn (ops.schema_name ()[db]);
+@@ -268,18 +268,18 @@ generate (options const& ops,
+             cerr << in_log_path << ": error: wrong schema name '" <<
+               old_changelog->schema_name () << "', expected '" << sn <<
+               "'" << endl;
+-            throw generator::failed ();
++            throw generator_failed ();
+           }
+         }
+         catch (const ios_base::failure& e)
+         {
+           cerr << in_log_path << ": read failure" << endl;
+-          throw failed ();
++          throw generator_failed ();
+         }
+         catch (const xml::parsing& e)
+         {
+           cerr << e.what () << endl;
+-          throw failed ();
++          throw generator_failed ();
+         }
+       }
+ 
+@@ -976,12 +976,12 @@ generate (options const& ops,
+       catch (const ios_base::failure& e)
+       {
+         cerr << out_log_path << ": write failure" << endl;
+-        throw failed ();
++        throw generator_failed ();
+       }
+       catch (const xml::serialization& e)
+       {
+         cerr << e.what () << endl;
+-        throw failed ();
++        throw generator_failed ();
+       }
+     }
+ 
+@@ -998,18 +998,18 @@ generate (options const& ops,
+   {
+     // Code generation failed. Diagnostics has already been issued.
+     //
+-    throw failed ();
++    throw generator_failed ();
+   }
+   catch (semantics::invalid_path const& e)
+   {
+     cerr << "error: '" << e.path () << "' is not a valid filesystem path"
+          << endl;
+-    throw failed ();
++    throw generator_failed ();
+   }
+   catch (fs::error const&)
+   {
+     // Auto-removal of generated files failed. Ignore it.
+     //
+-    throw failed ();
++    throw generator_failed ();
+   }
+ }
+diff --git a/odb/generator.hxx b/odb/generator.hxx
+index ce49295..e83d94d 100644
+--- a/odb/generator.hxx
++++ b/odb/generator.hxx
+@@ -11,23 +11,13 @@
+ #include <odb/features.hxx>
+ #include <odb/semantics/unit.hxx>
+ 
+-class generator
+-{
+-public:
+-  class failed {};
+-
+-  void
+-  generate (options const&,
+-            features&,
+-            semantics::unit&,
+-            semantics::path const& file,
+-            std::vector<semantics::path> const& inputs);
+-
+-  generator () {}
+-
+-private:
+-  generator (generator const&);
+-  generator& operator= (generator const&);
+-};
++class generator_failed {};
++
++void
++generate (options const&,
++          features&,
++          semantics::unit&,
++          semantics::path const& file,
++          std::vector<semantics::path> const& inputs);
+ 
+ #endif // ODB_GENERATOR_HXX
+diff --git a/odb/plugin.cxx b/odb/plugin.cxx
+index e32f225..51f0cb1 100644
+--- a/odb/plugin.cxx
++++ b/odb/plugin.cxx
+@@ -199,27 +199,23 @@ gate_callback (void*, void*)
+     parser p (*options_, loc_pragmas_, ns_loc_pragmas_, decl_pragmas_);
+     auto_ptr<unit> u (p.parse (global_namespace, file_));
+ 
+-
+     features f;
+ 
+     // Validate, pass 1.
+     //
+-    validator v;
+-    v.validate (*options_, f, *u, file_, 1);
++    validate (*options_, f, *u, file_, 1);
+ 
+     // Process.
+     //
+-    processor pr;
+-    pr.process (*options_, f, *u, file_);
++    process (*options_, f, *u, file_);
+ 
+     // Validate, pass 2.
+     //
+-    v.validate (*options_, f, *u, file_, 2);
++    validate (*options_, f, *u, file_, 2);
+ 
+     // Generate.
+     //
+-    generator g;
+-    g.generate (*options_, f, *u, file_, inputs_);
++    generate (*options_, f, *u, file_, inputs_);
+   }
+   catch (cutl::re::format const& e)
+   {
+@@ -239,19 +235,19 @@ gate_callback (void*, void*)
+     //
+     r = 1;
+   }
+-  catch (validator::failed const&)
++  catch (validator_failed const&)
+   {
+     // Diagnostics has aready been issued.
+     //
+     r = 1;
+   }
+-  catch (processor::failed const&)
++  catch (processor_failed const&)
+   {
+     // Diagnostics has aready been issued.
+     //
+     r = 1;
+   }
+-  catch (generator::failed const&)
++  catch (generator_failed const&)
+   {
+     // Diagnostics has aready been issued.
+     //
+diff --git a/odb/processor.cxx b/odb/processor.cxx
+index a808a52..3a2cb1d 100644
+--- a/odb/processor.cxx
++++ b/odb/processor.cxx
+@@ -3064,7 +3064,7 @@ namespace
+   };
+ }
+ 
+-void processor::
++void
+ process (options const& ops,
+          features& f,
+          semantics::unit& unit,
+@@ -3120,6 +3120,6 @@ process (options const& ops,
+   {
+     // Processing failed. Diagnostics has already been issued.
+     //
+-    throw failed ();
++    throw processor_failed ();
+   }
+ }
+diff --git a/odb/processor.hxx b/odb/processor.hxx
+index 602b999..e62dd25 100644
+--- a/odb/processor.hxx
++++ b/odb/processor.hxx
+@@ -9,22 +9,12 @@
+ #include <odb/features.hxx>
+ #include <odb/semantics/unit.hxx>
+ 
+-class processor
+-{
+-public:
+-  class failed {};
++class processor_failed {};
+ 
+-  void
+-  process (options const&,
+-           features&,
+-           semantics::unit&,
+-           semantics::path const&);
+-
+-  processor () {}
+-
+-private:
+-  processor (processor const&);
+-  processor& operator= (processor const&);
+-};
++void
++process (options const&,
++         features&,
++         semantics::unit&,
++         semantics::path const&);
+ 
+ #endif // ODB_PROCESSOR_HXX
+diff --git a/odb/relational/validator.cxx b/odb/relational/validator.cxx
+index 1d51c9a..47f089c 100644
+--- a/odb/relational/validator.cxx
++++ b/odb/relational/validator.cxx
+@@ -528,7 +528,7 @@ namespace relational
+     };
+   }
+ 
+-  void validator::
++  void
+   validate (options const&,
+             features&,
+             semantics::unit& u,
+@@ -608,7 +608,7 @@ namespace relational
+     }
+ 
+     if (!valid)
+-      throw failed ();
++      throw operation_failed ();
+ 
+     if (pass == 1)
+     {
+@@ -636,6 +636,6 @@ namespace relational
+     }
+ 
+     if (!valid)
+-      throw failed ();
++      throw operation_failed ();
+   }
+ }
+diff --git a/odb/relational/validator.hxx b/odb/relational/validator.hxx
+index f0ede53..93360c3 100644
+--- a/odb/relational/validator.hxx
++++ b/odb/relational/validator.hxx
+@@ -11,26 +11,15 @@
+ 
+ namespace relational
+ {
+-  class validator
+-  {
+-  public:
+-    struct failed {};
+-
+-    // The first pass is performed before processing. The second -- after.
+-    //
+-    void
+-    validate (options const&,
+-              features&,
+-              semantics::unit&,
+-              semantics::path const&,
+-              unsigned short pass);
+-
+-    validator () {}
+-
+-  private:
+-    validator (validator const&);
+-    validator& operator= (validator const&);
+-  };
++  // The first pass is performed before processing. The second -- after.
++  // Throws operation_failed to signal a failure.
++  //
++  void
++  validate (options const&,
++            features&,
++            semantics::unit&,
++            semantics::path const&,
++            unsigned short pass);
+ }
+ 
+ #endif // ODB_RELATIONAL_VALIDATOR_HXX
+diff --git a/odb/validator.cxx b/odb/validator.cxx
+index e80f4d8..91d91e5 100644
+--- a/odb/validator.cxx
++++ b/odb/validator.cxx
+@@ -1457,7 +1457,7 @@ namespace
+   };
+ }
+ 
+-void validator::
++void
+ validate (options const& ops,
+           features& f,
+           semantics::unit& u,
+@@ -1506,7 +1506,7 @@ validate (options const& ops,
+   }
+ 
+   if (!valid)
+-    throw failed ();
++    throw validator_failed ();
+ 
+   auto_ptr<context> ctx (create_context (cerr, u, ops, f, 0));
+ 
+@@ -1559,7 +1559,7 @@ validate (options const& ops,
+   }
+ 
+   if (!valid)
+-    throw failed ();
++    throw validator_failed ();
+ 
+   switch (db)
+   {
+@@ -1575,12 +1575,11 @@ validate (options const& ops,
+     {
+       try
+       {
+-        relational::validator v;
+-        v.validate (ops, f, u, p, pass);
++        relational::validate (ops, f, u, p, pass);
+       }
+-      catch (relational::validator::failed const&)
++      catch (operation_failed const&)
+       {
+-        throw failed ();
++        throw validator_failed ();
+       }
+ 
+       break;
+diff --git a/odb/validator.hxx b/odb/validator.hxx
+index f913049..3ffa470 100644
+--- a/odb/validator.hxx
++++ b/odb/validator.hxx
+@@ -9,25 +9,15 @@
+ #include <odb/features.hxx>
+ #include <odb/semantics/unit.hxx>
+ 
+-class validator
+-{
+-public:
+-  struct failed {};
++class validator_failed {};
+ 
+-  // The first pass is performed before processing. The second -- after.
+-  //
+-  void
+-  validate (options const&,
+-            features&,
+-            semantics::unit&,
+-            semantics::path const&,
+-            unsigned short pass);
+-
+-  validator () {}
+-
+-private:
+-  validator (validator const&);
+-  validator& operator= (validator const&);
+-};
++// The first pass is performed before processing. The second -- after.
++//
++void
++validate (options const&,
++          features&,
++          semantics::unit&,
++          semantics::path const&,
++          unsigned short pass);
+ 
+ #endif // ODB_VALIDATOR_HXX
+-- 
+2.25.0
+
diff --git a/package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch b/package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
new file mode 100644
index 0000000000..789b4cecc4
--- /dev/null
+++ b/package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
@@ -0,0 +1,311 @@
+From bf389fd5185143847b1d91aed423e79c322dba51 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Fri, 5 Feb 2016 16:01:42 +0200
+Subject: [PATCH 03/10] Initial work to make ODB compatible with GCC 6
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/cxx-lexer.cxx          |  4 ++++
+ odb/gcc-fwd.hxx            | 23 ++++++++++++++++++++++-
+ odb/gcc.hxx                | 10 ++++++++++
+ odb/include.cxx            | 31 +++++++++++++++++++++----------
+ odb/parser.cxx             |  8 ++++----
+ odb/plugin.cxx             | 29 +++++++++++++++++++++++++++--
+ odb/semantics/elements.cxx |  4 ++--
+ 7 files changed, 90 insertions(+), 19 deletions(-)
+
+diff --git a/odb/cxx-lexer.cxx b/odb/cxx-lexer.cxx
+index 7029c7e..64df296 100644
+--- a/odb/cxx-lexer.cxx
++++ b/odb/cxx-lexer.cxx
+@@ -135,8 +135,12 @@ cpp_error_callback (
+ #if BUILDING_GCC_MAJOR > 4 || BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR > 5
+   int /*reason*/, // Added in GCC 4.6.0.
+ #endif
++#if BUILDING_GCC_MAJOR <= 5
+   location_t,
+   unsigned int,
++#else
++  rich_location*,
++#endif
+   char const* msg,
+   va_list *ap)
+ {
+diff --git a/odb/gcc-fwd.hxx b/odb/gcc-fwd.hxx
+index a120f05..618b106 100644
+--- a/odb/gcc-fwd.hxx
++++ b/odb/gcc-fwd.hxx
+@@ -7,6 +7,24 @@
+ 
+ #include <bversion.h>
+ 
++#if BUILDING_GCC_MAJOR >= 6
++
++// If we include <system.h> here, it pulls in all kinds of GCC trouble that
++// "poisons" standard C/C++ declarations; see safe-ctype.h. So instead we
++// are going to "exclude" safe-ctype.h. To compensate, however, we will
++// include it first thing in gcc.hxx.
++//
++#  include <config.h>
++#  define SAFE_CTYPE_H
++#  include <system.h>
++#  undef SAFE_CTYPE_H
++#  include <coretypes.h>
++
++typedef unsigned int source_location; // <line-map.h>
++typedef source_location location_t;   // <input.h>
++
++#else // GCC < 6
++
+ #if BUILDING_GCC_MAJOR > 4 || BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR > 8
+ #  include <limits.h> // CHAR_BIT
+ #  include <config.h>
+@@ -33,6 +51,9 @@ extern "C"
+ 
+ typedef unsigned int source_location; // <line-map.h>
+ typedef source_location location_t;   // <input.h>
+-}
++
++} // extern "C"
++
++#endif
+ 
+ #endif // ODB_GCC_FWD_HXX
+diff --git a/odb/gcc.hxx b/odb/gcc.hxx
+index c953047..858d685 100644
+--- a/odb/gcc.hxx
++++ b/odb/gcc.hxx
+@@ -7,6 +7,10 @@
+ 
+ #include <odb/gcc-fwd.hxx>
+ 
++#if BUILDING_GCC_MAJOR >= 6
++#  include <safe-ctype.h> // See gcc-fwd.hxx.
++#endif
++
+ // GCC header includes to get the plugin and parse tree declarations.
+ // The order is important and doesn't follow any kind of logic.
+ //
+@@ -145,4 +149,10 @@ gcc_tree_code_name (gcc_tree_code_type tc) {return tree_code_name[tc];}
+ #define DECL_CHAIN(x) TREE_CHAIN(x)
+ #endif
+ 
++// In GCC 6, ANON_AGGRNAME_P became anon_aggrname_p().
++//
++#if BUILDING_GCC_MAJOR < 6
++#  define anon_aggrname_p(X) ANON_AGGRNAME_P(X)
++#endif
++
+ #endif // ODB_GCC_HXX
+diff --git a/odb/include.cxx b/odb/include.cxx
+index c397993..08c93ce 100644
+--- a/odb/include.cxx
++++ b/odb/include.cxx
+@@ -30,9 +30,18 @@ namespace
+     path path_;
+   };
+ 
++#if BUILDING_GCC_MAJOR >= 6
++  typedef line_map_ordinary line_map_type;
++#else
++  typedef line_map line_map_type;
++# ifndef linemap_check_ordinary
++#   define linemap_check_ordinary(X) (X)
++# endif
++#endif
++
+   struct includes
+   {
+-    typedef std::map<line_map const*, include_directive> map_type;
++    typedef std::map<line_map_type const*, include_directive> map_type;
+     bool trailing; // Included at the beginning or at the end of the main file.
+     map_type map;
+   };
+@@ -144,7 +153,9 @@ namespace
+       //
+       if (l > BUILTINS_LOCATION)
+       {
+-        line_map const* lm (linemap_lookup (line_table, l));
++        line_map_type const* lm (
++          linemap_check_ordinary (
++            linemap_lookup (line_table, l)));
+ 
+         if (lm != 0 && !MAIN_FILE_P (lm))
+         {
+@@ -537,20 +548,20 @@ namespace
+     //
+ #if BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR <= 6
+     size_t used (line_table->used);
+-    line_map const* maps (line_table->maps);
++    line_map_type const* maps (line_table->maps);
+ #else
+     size_t used (line_table->info_ordinary.used);
+-    line_map const* maps (line_table->info_ordinary.maps);
++    line_map_type const* maps (line_table->info_ordinary.maps);
+ #endif
+ 
+     for (size_t i (0); i < used; ++i)
+     {
+-      line_map const* m (maps + i);
++      line_map_type const* m (maps + i);
+ 
+       if (MAIN_FILE_P (m) || m->reason != LC_ENTER)
+         continue;
+ 
+-      line_map const* ifm (INCLUDED_FROM (line_table, m));
++      line_map_type const* ifm (INCLUDED_FROM (line_table, m));
+ 
+ #if BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR <= 6
+       path f (m->to_file);
+@@ -580,7 +591,7 @@ namespace
+       for (includes::iterator j (i->second.begin ());
+            j != i->second.end (); ++j)
+       {
+-        line_map const* lm (j->first);
++        line_map_type const* lm (j->first);
+         cerr << '\t' << lm->to_file << ":" << LAST_SOURCE_LINE (lm) << endl;
+       }
+       */
+@@ -589,13 +600,13 @@ namespace
+       // it is preferred over all others. Use the first one if there are
+       // several.
+       //
+-      line_map const* main_lm (0);
++      line_map_type const* main_lm (0);
+       include_directive* main_inc (0);
+ 
+       for (includes::map_type::iterator j (i->second.map.begin ());
+            j != i->second.map.end (); ++j)
+       {
+-        line_map const* lm (j->first);
++        line_map_type const* lm (j->first);
+ 
+         if (MAIN_FILE_P (lm))
+         {
+@@ -636,7 +647,7 @@ namespace
+       for (includes::map_type::iterator j (i->second.map.begin ());
+            j != i->second.map.end (); ++j)
+       {
+-        line_map const* lm (j->first);
++        line_map_type const* lm (j->first);
+ 
+ #if BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR <= 6
+         string f (lm->to_file);
+diff --git a/odb/parser.cxx b/odb/parser.cxx
+index a8e6a6a..feda9d4 100644
+--- a/odb/parser.cxx
++++ b/odb/parser.cxx
+@@ -1044,14 +1044,14 @@ emit_type_decl (tree decl)
+     // says that in typedef struct {} S; S becomes struct's
+     // name.
+     //
+-    if (ANON_AGGRNAME_P (decl_name))
++    if (anon_aggrname_p (decl_name))
+     {
+       tree d (TYPE_NAME (t));
+ 
+       if (d != NULL_TREE &&
+           !DECL_ARTIFICIAL (d) &&
+           DECL_NAME (d) != NULL_TREE &&
+-          !ANON_AGGRNAME_P (DECL_NAME (d)))
++          !anon_aggrname_p (DECL_NAME (d)))
+       {
+         decl = d;
+         decl_name = DECL_NAME (decl);
+@@ -1668,7 +1668,7 @@ create_type (tree t,
+             ts << "start anon/stub " << gcc_tree_code_name(tc) << "@"
+                << file << ":" << line << endl;
+ 
+-          if (d == NULL_TREE || ANON_AGGRNAME_P (DECL_NAME (d)))
++          if (d == NULL_TREE || anon_aggrname_p (DECL_NAME (d)))
+           {
+             if (tc == RECORD_TYPE)
+               r = &emit_class<class_> (t, file, line, clmn);
+@@ -1765,7 +1765,7 @@ create_type (tree t,
+         ts << "start anon/stub " << gcc_tree_code_name(tc) << "@"
+            << file << ":" << line << endl;
+ 
+-      if (d == NULL_TREE || ANON_AGGRNAME_P (DECL_NAME (d)))
++      if (d == NULL_TREE || anon_aggrname_p (DECL_NAME (d)))
+       {
+         r = &emit_enum (t, access, file, line, clmn);
+       }
+diff --git a/odb/plugin.cxx b/odb/plugin.cxx
+index 51f0cb1..779faed 100644
+--- a/odb/plugin.cxx
++++ b/odb/plugin.cxx
+@@ -45,14 +45,28 @@ path file_;    // File being compiled.
+ paths inputs_; // List of input files in at-once mode or just file_.
+ 
+ bool (*cpp_error_prev) (
+-  cpp_reader*, int, int, location_t, unsigned int, const char*, va_list*);
++  cpp_reader*,
++  int,
++  int,
++#if BUILDING_GCC_MAJOR >= 6
++  rich_location*,
++#else
++  location_t,
++  unsigned int,
++#endif
++  const char*,
++  va_list*);
+ 
+ static bool
+ cpp_error_filter (cpp_reader* r,
+                   int level,
+                   int reason,
++#if BUILDING_GCC_MAJOR >= 6
++                  rich_location* l,
++#else
+                   location_t l,
+                   unsigned int column_override,
++#endif
+                   const char* msg,
+                   va_list* ap)
+ {
+@@ -66,7 +80,18 @@ cpp_error_filter (cpp_reader* r,
+   if (strstr (msg, "#pragma once") != 0)
+     return true;
+ 
+-  return cpp_error_prev (r, level, reason, l, column_override, msg, ap);
++  return cpp_error_prev (
++    r,
++    level,
++    reason,
++#if BUILDING_GCC_MAJOR >= 6
++    l,
++#else
++    l,
++    column_override,
++#endif
++    msg,
++    ap);
+ }
+ 
+ // A prefix of the _cpp_file struct. This struct is not part of the
+diff --git a/odb/semantics/elements.cxx b/odb/semantics/elements.cxx
+index 21e3260..399d5e9 100644
+--- a/odb/semantics/elements.cxx
++++ b/odb/semantics/elements.cxx
+@@ -59,7 +59,7 @@ namespace semantics
+       if (tree decl = TYPE_NAME (n))
+         name = DECL_NAME (decl);
+ 
+-      return name != 0 && ANON_AGGRNAME_P (name);
++      return name != 0 && anon_aggrname_p (name);
+     }
+ 
+     return true;
+@@ -108,7 +108,7 @@ namespace semantics
+       if (tree decl = TYPE_NAME (type))
+       {
+         name = DECL_NAME (decl);
+-        if (name != 0 && ANON_AGGRNAME_P (name))
++        if (name != 0 && anon_aggrname_p (name))
+           return true;
+ 
+         tree s (CP_DECL_CONTEXT (decl));
+-- 
+2.25.0
+
diff --git a/package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch b/package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
new file mode 100644
index 0000000000..b0190b1b52
--- /dev/null
+++ b/package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
@@ -0,0 +1,47 @@
+From 4584b69c45b701c3689d6a974f1ee560a79a243e Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Mon, 8 Feb 2016 18:39:21 +0200
+Subject: [PATCH 04/10] Make compilable with GCC 6 in C++14 mode
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/gcc.hxx    | 9 ++++++---
+ odb/parser.cxx | 2 ++
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/odb/gcc.hxx b/odb/gcc.hxx
+index 858d685..a22357d 100644
+--- a/odb/gcc.hxx
++++ b/odb/gcc.hxx
+@@ -7,9 +7,12 @@
+ 
+ #include <odb/gcc-fwd.hxx>
+ 
+-#if BUILDING_GCC_MAJOR >= 6
+-#  include <safe-ctype.h> // See gcc-fwd.hxx.
+-#endif
++// Actually, let's keep it out. With it included we can compile in C++98
++// but not in C++14 (GCC 6 default).
++//
++// #if BUILDING_GCC_MAJOR >= 6
++// #  include <safe-ctype.h> // See gcc-fwd.hxx.
++// #endif
+ 
+ // GCC header includes to get the plugin and parse tree declarations.
+ // The order is important and doesn't follow any kind of logic.
+diff --git a/odb/parser.cxx b/odb/parser.cxx
+index feda9d4..a9d22fb 100644
+--- a/odb/parser.cxx
++++ b/odb/parser.cxx
+@@ -1831,6 +1831,8 @@ create_type (tree t,
+       // the array type. In other words, we view it as "constant array"
+       // rather than "array of constant elements".
+       //
++      using semantics::array; // vs std::array.
++
+       tree bt (TREE_TYPE (t));
+       tree bt_mv (TYPE_MAIN_VARIANT (bt));
+       type& bt_node (emit_type (bt_mv, access::public_, file, line, clmn));
+-- 
+2.25.0
+
diff --git a/package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch b/package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch
new file mode 100644
index 0000000000..fdf4e3ccae
--- /dev/null
+++ b/package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch
@@ -0,0 +1,33 @@
+From 029687831099bf1dcc944517f9e48af1db5b0361 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Fri, 23 Dec 2016 10:18:01 +0200
+Subject: [PATCH 05/10] Fix bug in GCC 6 input_location translation
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/cxx-lexer.cxx | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/odb/cxx-lexer.cxx b/odb/cxx-lexer.cxx
+index 64df296..ae045d9 100644
+--- a/odb/cxx-lexer.cxx
++++ b/odb/cxx-lexer.cxx
+@@ -106,7 +106,15 @@ next (string& token, tree* node)
+ location_t cxx_pragma_lexer::
+ location () const
+ {
++  // Starting from GCC 6 the input location seem to require the same
++  // translation as what we do in real_source_location().
++  //
++#if BUILDING_GCC_MAJOR >= 6
++  return linemap_resolve_location (
++    line_table, input_location, LRK_MACRO_EXPANSION_POINT, 0);
++#else
+   return input_location;
++#endif
+ }
+ 
+ string cxx_pragma_lexer::
+-- 
+2.25.0
+
diff --git a/package/odb/0006-Adapt-to-changes-in-GCC-8.patch b/package/odb/0006-Adapt-to-changes-in-GCC-8.patch
new file mode 100644
index 0000000000..ccb2ca5c46
--- /dev/null
+++ b/package/odb/0006-Adapt-to-changes-in-GCC-8.patch
@@ -0,0 +1,226 @@
+From aca617685045b1984c19c415a474893407578394 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Tue, 7 Nov 2017 14:58:43 +0200
+Subject: [PATCH 06/10] Adapt to changes in GCC 8
+
+---
+ odb/cxx-lexer.cxx          | 16 ++++++++++++++--
+ odb/parser.cxx             | 27 ++++++++++++++++++++++++++-
+ odb/processor.cxx          | 30 ++++++++++++++++++++++--------
+ odb/semantics/elements.cxx |  8 ++++++++
+ odb/validator.cxx          | 10 +++++++++-
+ 5 files changed, 79 insertions(+), 12 deletions(-)
+
+diff --git a/odb/cxx-lexer.cxx b/odb/cxx-lexer.cxx
+index ae045d9..cfebbb5 100644
+--- a/odb/cxx-lexer.cxx
++++ b/odb/cxx-lexer.cxx
+@@ -93,7 +93,13 @@ next (string& token, tree* node)
+   // See if this is a keyword using the C++ parser machinery and
+   // the current C++ dialect.
+   //
+-  if (*type_ == CPP_NAME && C_IS_RESERVED_WORD (*token_))
++  if (*type_ == CPP_NAME &&
++#if BUILDING_GCC_MAJOR >= 8
++      IDENTIFIER_KEYWORD_P (*token_)
++#else
++      C_IS_RESERVED_WORD (*token_)
++#endif
++  )
+     *type_ = CPP_KEYWORD;
+ 
+   if (node != 0 && node != token_)
+@@ -281,7 +287,13 @@ next (string& token, tree* node)
+       //
+       tree id (get_identifier (name));
+ 
+-      if (C_IS_RESERVED_WORD (id))
++      if (
++#if BUILDING_GCC_MAJOR >= 8
++        IDENTIFIER_KEYWORD_P (id)
++#else
++        C_IS_RESERVED_WORD (id)
++#endif
++      )
+         tt = CPP_KEYWORD;
+ 
+       if (node != 0)
+diff --git a/odb/parser.cxx b/odb/parser.cxx
+index a9d22fb..927063b 100644
+--- a/odb/parser.cxx
++++ b/odb/parser.cxx
+@@ -889,8 +889,23 @@ collect (tree ns)
+ 
+   // Traverse namespaces.
+   //
+-  for (decl = level->namespaces; decl != NULL_TREE; decl = TREE_CHAIN (decl))
++  for (
++#if BUILDING_GCC_MAJOR >= 8
++    decl = level->names;
++#else
++    decl = level->namespaces;
++#endif
++    decl != NULL_TREE;
++    decl = TREE_CHAIN (decl))
+   {
++#if BUILDING_GCC_MAJOR >= 8
++    // Now namespaces are interleaved with other declarations. In fact, we
++    // could probably collect everything in a single pass.
++    //
++    if (TREE_CODE (decl) != NAMESPACE_DECL)
++      continue;
++#endif
++
+     if (!DECL_IS_BUILTIN (decl) || DECL_NAMESPACE_STD_P (decl))
+     {
+       if (trace)
+@@ -960,9 +975,15 @@ emit ()
+         // approximation for this namespace origin. Also resolve
+         // the tree node for this namespace.
+         //
++#if BUILDING_GCC_MAJOR >= 8
++        tree tree_node (
++          get_namespace_binding (
++            scope_->tree_node (), get_identifier (n.c_str ())));
++#else
+         tree tree_node (
+           namespace_binding (
+             get_identifier (n.c_str ()), scope_->tree_node ()));
++#endif
+ 
+         namespace_& node (unit_->new_node<namespace_> (f, l, c, tree_node));
+         unit_->new_edge<defines> (*scope_, node, n);
+@@ -2218,7 +2239,11 @@ fq_scope (tree decl)
+ 
+     // If this is an inline namespace, pretend it doesn't exist.
+     //
++#if BUILDING_GCC_MAJOR >= 8
++    if (!is_nested_namespace (prev, scope, true))
++#else
+     if (!is_associated_namespace (prev, scope))
++#endif
+     {
+       tree n = DECL_NAME (scope);
+ 
+diff --git a/odb/processor.cxx b/odb/processor.cxx
+index 3a2cb1d..bea3624 100644
+--- a/odb/processor.cxx
++++ b/odb/processor.cxx
+@@ -423,12 +423,17 @@ namespace
+ 
+             // OVL_* macros work for both FUNCTION_DECL and OVERLOAD.
+             //
+-            for (tree o (BASELINK_FUNCTIONS (decl));
+-                 o != 0;
+-                 o = OVL_NEXT (o))
++#if BUILDING_GCC_MAJOR >= 8
++            for (ovl_iterator i (BASELINK_FUNCTIONS (decl)); i; ++i)
++#else
++            for (tree o (BASELINK_FUNCTIONS (decl)); o != 0; o = OVL_NEXT (o))
++#endif
+             {
++#if BUILDING_GCC_MAJOR >= 8
++              tree f (*i);
++#else
+               tree f (OVL_CURRENT (o));
+-
++#endif
+               // We are only interested in public non-static member
+               // functions. Note that TREE_PUBLIC() returns something
+               // other than what we need.
+@@ -530,12 +535,17 @@ namespace
+           {
+             // OVL_* macros work for both FUNCTION_DECL and OVERLOAD.
+             //
+-            for (tree o (BASELINK_FUNCTIONS (decl));
+-                 o != 0;
+-                 o = OVL_NEXT (o))
++#if BUILDING_GCC_MAJOR >= 8
++            for (ovl_iterator i (BASELINK_FUNCTIONS (decl)); i; ++i)
++#else
++            for (tree o (BASELINK_FUNCTIONS (decl)); o != 0; o = OVL_NEXT (o))
++#endif
+             {
++#if BUILDING_GCC_MAJOR >= 8
++              tree f (*i);
++#else
+               tree f (OVL_CURRENT (o));
+-
++#endif
+               // We are only interested in non-static member functions.
+               //
+               if (!DECL_NONSTATIC_MEMBER_FUNCTION_P (f))
+@@ -2934,7 +2944,11 @@ namespace
+                   {
+                     tree prev (CP_DECL_CONTEXT (scope));
+ 
++#if BUILDING_GCC_MAJOR >= 8
++                    if (!is_nested_namespace (prev, scope, true))
++#else
+                     if (!is_associated_namespace (prev, scope))
++#endif
+                       break;
+ 
+                     scope = prev;
+diff --git a/odb/semantics/elements.cxx b/odb/semantics/elements.cxx
+index 399d5e9..4c380d8 100644
+--- a/odb/semantics/elements.cxx
++++ b/odb/semantics/elements.cxx
+@@ -126,7 +126,11 @@ namespace semantics
+           {
+             tree prev (CP_DECL_CONTEXT (s));
+ 
++#if BUILDING_GCC_MAJOR >= 8
++            if (!is_nested_namespace (prev, s, true))
++#else
+             if (!is_associated_namespace (prev, s))
++#endif
+               break;
+ 
+             s = prev;
+@@ -223,7 +227,11 @@ namespace semantics
+             {
+               // Check if this is an inline namespace and skip it if so.
+               //
++#if BUILDING_GCC_MAJOR >= 8
++              if (is_nested_namespace (ns, new_ns, true))
++#else
+               if (is_associated_namespace (ns, new_ns))
++#endif
+               {
+                 // Skip also the following scope operator. Strictly speaking
+                 // there could be none (i.e., this is a name of an inline
+diff --git a/odb/validator.cxx b/odb/validator.cxx
+index 91d91e5..aac52e4 100644
+--- a/odb/validator.cxx
++++ b/odb/validator.cxx
+@@ -520,9 +520,17 @@ namespace
+         // Figure out if we have a const version of the callback. OVL_*
+         // macros work for both FUNCTION_DECL and OVERLOAD.
+         //
++#if BUILDING_GCC_MAJOR >= 8
++          for (ovl_iterator i (BASELINK_FUNCTIONS (decl)); i; ++i)
++#else
+         for (tree o (BASELINK_FUNCTIONS (decl)); o != 0; o = OVL_NEXT (o))
++#endif
+         {
++#if BUILDING_GCC_MAJOR >= 8
++            tree f (*i);
++#else
+           tree f (OVL_CURRENT (o));
++#endif
+           if (DECL_CONST_MEMFUNC_P (f))
+           {
+             c.set ("callback-const", true);
+@@ -1223,7 +1231,7 @@ namespace
+             compiler, get_identifier ("has_lt_operator"), false, false);
+ 
+           if (has_lt_operator_ != error_mark_node)
+-            has_lt_operator_ = OVL_CURRENT (has_lt_operator_);
++            has_lt_operator_ = OVL_FIRST (has_lt_operator_);
+           else
+           {
+             os << unit.file () << ": error: unable to resolve has_lt_operator "
+-- 
+2.25.0
+
diff --git a/package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch b/package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
new file mode 100644
index 0000000000..2306dc8287
--- /dev/null
+++ b/package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
@@ -0,0 +1,350 @@
+From c5bea9562929c6b55ca208a530ae80033eeb1614 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Tue, 7 Nov 2017 10:37:53 +0200
+Subject: [PATCH 07/10] Switch to C++11, get rid of auto_ptr use
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/Makefile.am   |  5 +++++
+ odb/context.cxx   |  4 ++--
+ odb/context.hxx   |  4 ++--
+ odb/generator.cxx | 18 +++++++++---------
+ odb/options.cli   |  4 ++--
+ odb/parser.cxx    | 14 ++++++++++----
+ odb/parser.hxx    |  7 ++++---
+ odb/plugin.cxx    | 10 +++++-----
+ odb/processor.cxx |  6 +++---
+ odb/validator.cxx |  2 +-
+ 10 files changed, 43 insertions(+), 31 deletions(-)
+
+diff --git a/odb/Makefile.am b/odb/Makefile.am
+index 2f01398..d9e83d7 100644
+--- a/odb/Makefile.am
++++ b/odb/Makefile.am
+@@ -9,6 +9,11 @@ plugin_LTLIBRARIES = odb.la
+ 
+ AM_CPPFLAGS = -I'$(top_builddir)' -I'$(top_srcdir)'
+ 
++# Note: not passed by libtool when linking odb.so. Seems to be harmless for
++# now.
++#
++AM_CXXFLAGS = -std=c++0x
++
+ EXTRA_DIST = common-query.hxx common.hxx context.hxx context.ixx cxx-lexer.hxx cxx-token.hxx diagnostics.hxx emitter.hxx features.hxx gcc-fwd.hxx gcc.hxx generate.hxx generator.hxx instance.hxx location.hxx lookup.hxx option-functions.hxx option-parsers.hxx option-types.hxx options.hxx options.ixx parser.hxx pragma.hxx processor.hxx profile.hxx relational/common-query.hxx relational/common.hxx relational/common.txx relational/context.hxx relational/context.ixx relational/generate.hxx relational/header.hxx relational/inline.hxx relational/model.hxx relational/mssql/common.hxx relational/mssql/context.hxx relational/mysql/common.hxx relational/mysql/context.hxx relational/oracle/common.hxx relational/oracle/context.hxx relational/pgsql/common.hxx relational/pgsql/context.hxx relational/processor.hxx relational/schema-source.hxx relational/schema.hxx relational/source.hxx relational/sqlite/common.hxx relational/sqlite/context.hxx relational/validator.hxx semantics.hxx semantics/class-template.hxx semantics/class.hxx semantics/derived.hxx semantics/elements.hxx semantics/elements.ixx semantics/enum.hxx semantics/fundamental.hxx semantics/namespace.hxx semantics/relational.hxx semantics/relational/changelog.hxx semantics/relational/changeset.hxx semantics/relational/column.hxx semantics/relational/deferrable.hxx semantics/relational/elements.hxx semantics/relational/elements.txx semantics/relational/foreign-key.hxx semantics/relational/index.hxx semantics/relational/key.hxx semantics/relational/model.hxx semantics/relational/name.hxx semantics/relational/primary-key.hxx semantics/relational/table.hxx semantics/template.hxx semantics/union-template.hxx semantics/union.hxx semantics/unit.hxx sql-lexer.hxx sql-lexer.ixx sql-token.hxx sql-token.ixx traversal.hxx traversal/class-template.hxx traversal/class.hxx traversal/derived.hxx traversal/elements.hxx traversal/enum.hxx traversal/fundamental.hxx traversal/namespace.hxx traversal/relational.hxx traversal/relational/changelog.hxx traversal/relational/changeset.hxx traversal/relational/column.hxx traversal/relational/elements.hxx traversal/relational/foreign-key.hxx traversal/relational/index.hxx traversal/relational/key.hxx traversal/relational/model.hxx traversal/relational/primary-key.hxx traversal/relational/table.hxx traversal/template.hxx traversal/union-template.hxx traversal/union.hxx traversal/unit.hxx validator.hxx version.hxx options.cli
+ 
+ # Plugin.
+diff --git a/odb/context.cxx b/odb/context.cxx
+index d62fa88..87f1c32 100644
+--- a/odb/context.cxx
++++ b/odb/context.cxx
+@@ -564,14 +564,14 @@ namespace
+   };
+ }
+ 
+-auto_ptr<context>
++unique_ptr<context>
+ create_context (ostream& os,
+                 semantics::unit& unit,
+                 options const& ops,
+                 features& f,
+                 semantics::relational::model* m)
+ {
+-  auto_ptr<context> r;
++  unique_ptr<context> r;
+ 
+   switch (ops.database ()[0])
+   {
+diff --git a/odb/context.hxx b/odb/context.hxx
+index 351bc61..10de237 100644
+--- a/odb/context.hxx
++++ b/odb/context.hxx
+@@ -13,7 +13,7 @@
+ #include <stack>
+ #include <vector>
+ #include <string>
+-#include <memory>  // std::auto_ptr
++#include <memory>  // std::unique_ptr
+ #include <ostream>
+ #include <cstddef> // std::size_t
+ #include <iostream>
+@@ -1691,7 +1691,7 @@ private:
+ 
+ // Create concrete database context.
+ //
+-std::auto_ptr<context>
++std::unique_ptr<context>
+ create_context (std::ostream&,
+                 semantics::unit&,
+                 options const&,
+diff --git a/odb/generator.cxx b/odb/generator.cxx
+index 6aa5151..266b75f 100644
+--- a/odb/generator.cxx
++++ b/odb/generator.cxx
+@@ -4,7 +4,7 @@
+ 
+ #include <cctype>  // std::toupper, std::is{alpha,upper,lower}
+ #include <string>
+-#include <memory>  // std::auto_ptr
++#include <memory>  // std::unique_ptr
+ #include <iomanip>
+ #include <fstream>
+ #include <sstream>
+@@ -141,7 +141,7 @@ generate (options const& ops,
+ 
+     if (gen_schema)
+     {
+-      auto_ptr<context> ctx (create_context (cerr, unit, ops, fts, 0));
++      unique_ptr<context> ctx (create_context (cerr, unit, ops, fts, 0));
+ 
+       switch (db)
+       {
+@@ -471,7 +471,7 @@ generate (options const& ops,
+     //
+     if (gen_cxx)
+     {
+-      auto_ptr<context> ctx (
++      unique_ptr<context> ctx (
+         create_context (hxx, unit, ops, fts, model.get ()));
+ 
+       sloc_filter sloc (ctx->os);
+@@ -581,7 +581,7 @@ generate (options const& ops,
+     //
+     if (gen_cxx)
+     {
+-      auto_ptr<context> ctx (
++      unique_ptr<context> ctx (
+         create_context (ixx, unit, ops, fts, model.get ()));
+ 
+       sloc_filter sloc (ctx->os);
+@@ -641,7 +641,7 @@ generate (options const& ops,
+     //
+     if (gen_cxx && (db != database::common || md == multi_database::dynamic))
+     {
+-      auto_ptr<context> ctx (
++      unique_ptr<context> ctx (
+         create_context (cxx, unit, ops, fts, model.get ()));
+ 
+       sloc_filter sloc (ctx->os);
+@@ -734,7 +734,7 @@ generate (options const& ops,
+     //
+     if (gen_sep_schema)
+     {
+-      auto_ptr<context> ctx (
++      unique_ptr<context> ctx (
+         create_context (sch, unit, ops, fts, model.get ()));
+ 
+       sloc_filter sloc (ctx->os);
+@@ -799,7 +799,7 @@ generate (options const& ops,
+     //
+     if (gen_sql_schema)
+     {
+-      auto_ptr<context> ctx (
++      unique_ptr<context> ctx (
+         create_context (sql, unit, ops, fts, model.get ()));
+ 
+       switch (db)
+@@ -865,7 +865,7 @@ generate (options const& ops,
+         //
+         {
+           ofstream& mig (*mig_pre[i]);
+-          auto_ptr<context> ctx (create_context (mig, unit, ops, fts, 0));
++          unique_ptr<context> ctx (create_context (mig, unit, ops, fts, 0));
+ 
+           switch (db)
+           {
+@@ -908,7 +908,7 @@ generate (options const& ops,
+         //
+         {
+           ofstream& mig (*mig_post[i]);
+-          auto_ptr<context> ctx (create_context (mig, unit, ops, fts, 0));
++          unique_ptr<context> ctx (create_context (mig, unit, ops, fts, 0));
+ 
+           switch (db)
+           {
+diff --git a/odb/options.cli b/odb/options.cli
+index cf278cb..c994975 100644
+--- a/odb/options.cli
++++ b/odb/options.cli
+@@ -211,10 +211,10 @@ class options
+      \cb{db pointer} pragma will use this pointer by default. The value
+      of this option can be \cb{*} which denotes the raw pointer and is
+      the default, or qualified name of a smart pointer class template,
+-     for example, \cb{std::auto_ptr}. In the latter case, the ODB compiler
++     for example, \cb{std::shared_ptr}. In the latter case, the ODB compiler
+      constructs the object or view pointer by adding a single template
+      argument of the object or view type to the qualified name, for example
+-     \cb{std::auto_ptr<object>}. The ODB runtime uses object and view
++     \cb{std::shared_ptr<object>}. The ODB runtime uses object and view
+      pointers to return, and, in case of objects, pass and cache
+      dynamically allocated instances of object and view types.
+ 
+diff --git a/odb/parser.cxx b/odb/parser.cxx
+index 927063b..30e45af 100644
+--- a/odb/parser.cxx
++++ b/odb/parser.cxx
+@@ -26,7 +26,7 @@ public:
+ 
+   impl (options const&, loc_pragmas&, ns_loc_pragmas&, decl_pragmas&);
+ 
+-  auto_ptr<unit>
++  unique_ptr<unit>
+   parse (tree global_scope, path const& main_file);
+ 
+ private:
+@@ -728,10 +728,10 @@ impl (options const& ops,
+ {
+ }
+ 
+-auto_ptr<unit> parser::impl::
++unique_ptr<unit> parser::impl::
+ parse (tree global_scope, path const& main_file)
+ {
+-  auto_ptr<unit> u (new unit (main_file));
++  unique_ptr<unit> u (new unit (main_file));
+   u->insert (global_namespace, *u);
+   process_named_pragmas (global_namespace, *u);
+ 
+@@ -2263,6 +2263,12 @@ fq_scope (tree decl)
+ // parser
+ //
+ 
++parser::
++~parser ()
++{
++  // Needs parser::impl definition.
++}
++
+ parser::
+ parser (options const& ops,
+         loc_pragmas& lp,
+@@ -2272,7 +2278,7 @@ parser (options const& ops,
+ {
+ }
+ 
+-auto_ptr<unit> parser::
++unique_ptr<unit> parser::
+ parse (tree global_scope, path const& main_file)
+ {
+   return impl_->parse (global_scope, main_file);
+diff --git a/odb/parser.hxx b/odb/parser.hxx
+index 80e4aa4..648337f 100644
+--- a/odb/parser.hxx
++++ b/odb/parser.hxx
+@@ -7,7 +7,7 @@
+ 
+ #include <odb/gcc.hxx>
+ 
+-#include <memory>  // std::auto_ptr
++#include <memory>  // std::unique_ptr
+ 
+ #include <odb/pragma.hxx>
+ #include <odb/options.hxx>
+@@ -18,9 +18,10 @@ class parser
+ public:
+   class failed {};
+ 
++  ~parser ();
+   parser (options const&, loc_pragmas&, ns_loc_pragmas&, decl_pragmas&);
+ 
+-  std::auto_ptr<semantics::unit>
++  std::unique_ptr<semantics::unit>
+   parse (tree global_scope, semantics::path const& main_file);
+ 
+ private:
+@@ -31,7 +32,7 @@ private:
+ 
+ private:
+   class impl;
+-  std::auto_ptr<impl> impl_;
++  std::unique_ptr<impl> impl_;
+ };
+ 
+ #endif // ODB_PARSER_HXX
+diff --git a/odb/plugin.cxx b/odb/plugin.cxx
+index 779faed..0fac632 100644
+--- a/odb/plugin.cxx
++++ b/odb/plugin.cxx
+@@ -8,7 +8,7 @@
+ #include <sys/types.h> // stat
+ #include <sys/stat.h>  // stat
+ 
+-#include <memory>  // std::auto_ptr
++#include <memory>  // std::unique_ptr
+ #include <string>
+ #include <vector>
+ #include <cstring> // std::strcpy, std::strstr
+@@ -39,7 +39,7 @@ using cutl::fs::invalid_path;
+ typedef vector<path> paths;
+ 
+ int plugin_is_GPL_compatible;
+-auto_ptr<options const> options_;
++unique_ptr<options const> options_;
+ paths profile_paths_;
+ path file_;    // File being compiled.
+ paths inputs_; // List of input files in at-once mode or just file_.
+@@ -222,7 +222,7 @@ gate_callback (void*, void*)
+     // Parse the GCC tree to semantic graph.
+     //
+     parser p (*options_, loc_pragmas_, ns_loc_pragmas_, decl_pragmas_);
+-    auto_ptr<unit> u (p.parse (global_namespace, file_));
++    unique_ptr<unit> u (p.parse (global_namespace, file_));
+ 
+     features f;
+ 
+@@ -377,14 +377,14 @@ plugin_init (plugin_name_args* plugin_info, plugin_gcc_version*)
+       oi[2].arg = &pd;
+ 
+       cli::argv_file_scanner scan (argc, &argv[0], oi, 3);
+-      auto_ptr<options> ops (
++      unique_ptr<options> ops (
+         new options (scan, cli::unknown_mode::fail, cli::unknown_mode::fail));
+ 
+       // Process options.
+       //
+       process_options (*ops);
+ 
+-      options_ = ops;
++      options_ = move (ops);
+       pragma_db_ = db;
+       pragma_multi_ = options_->multi_database ();
+     }
+diff --git a/odb/processor.cxx b/odb/processor.cxx
+index bea3624..c787e0d 100644
+--- a/odb/processor.cxx
++++ b/odb/processor.cxx
+@@ -120,8 +120,8 @@ namespace
+       // both the wrapper type and the wrapped type must be const.
+       // To see why, consider these possibilities:
+       //
+-      // auto_ptr<const T> - can modify by setting a new pointer
+-      // const auto_ptr<T> - can modify by changing the pointed-to value
++      // unique_ptr<const T> - can modify by setting a new pointer
++      // const unique_ptr<T> - can modify by changing the pointed-to value
+       //
+       if (const_type (m.type ()) &&
+           !(id (m) || version (m) || m.count ("inverse")))
+@@ -3086,7 +3086,7 @@ process (options const& ops,
+ {
+   try
+   {
+-    auto_ptr<context> ctx (create_context (cerr, unit, ops, f, 0));
++    unique_ptr<context> ctx (create_context (cerr, unit, ops, f, 0));
+ 
+     // Common processing.
+     //
+diff --git a/odb/validator.cxx b/odb/validator.cxx
+index aac52e4..196386c 100644
+--- a/odb/validator.cxx
++++ b/odb/validator.cxx
+@@ -1516,7 +1516,7 @@ validate (options const& ops,
+   if (!valid)
+     throw validator_failed ();
+ 
+-  auto_ptr<context> ctx (create_context (cerr, u, ops, f, 0));
++  unique_ptr<context> ctx (create_context (cerr, u, ops, f, 0));
+ 
+   if (pass == 1)
+   {
+-- 
+2.25.0
+
diff --git a/package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch b/package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
new file mode 100644
index 0000000000..b3ac9a8d29
--- /dev/null
+++ b/package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
@@ -0,0 +1,32 @@
+From 8cc165a2f7f945db36a18e462138553a000292cd Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Tue, 7 Nov 2017 16:57:35 +0200
+Subject: [PATCH 08/10] Fix GCC 8 adaptation to be compatible with previous
+ versions
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/validator.cxx | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/odb/validator.cxx b/odb/validator.cxx
+index 196386c..f0edaaf 100644
+--- a/odb/validator.cxx
++++ b/odb/validator.cxx
+@@ -1231,7 +1231,13 @@ namespace
+             compiler, get_identifier ("has_lt_operator"), false, false);
+ 
+           if (has_lt_operator_ != error_mark_node)
++          {
++#if BUILDING_GCC_MAJOR >= 8
+             has_lt_operator_ = OVL_FIRST (has_lt_operator_);
++#else
++            has_lt_operator_ = OVL_CURRENT (has_lt_operator_);
++#endif
++          }
+           else
+           {
+             os << unit.file () << ": error: unable to resolve has_lt_operator "
+-- 
+2.25.0
+
diff --git a/package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch b/package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
new file mode 100644
index 0000000000..a9bdc89564
--- /dev/null
+++ b/package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
@@ -0,0 +1,29 @@
+From 2d37e44753c1e67de4658b6fdf95760432c74ead Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Fri, 5 Oct 2018 07:20:18 +0200
+Subject: [PATCH 09/10] Handle namespace aliases when parsing GCC tree
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/parser.cxx | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/odb/parser.cxx b/odb/parser.cxx
+index 30e45af..03bcb01 100644
+--- a/odb/parser.cxx
++++ b/odb/parser.cxx
+@@ -906,6 +906,11 @@ collect (tree ns)
+       continue;
+ #endif
+ 
++    // Ignore namespace aliases.
++    //
++    if (DECL_NAMESPACE_ALIAS (decl))
++      continue;
++
+     if (!DECL_IS_BUILTIN (decl) || DECL_NAMESPACE_STD_P (decl))
+     {
+       if (trace)
+-- 
+2.25.0
+
diff --git a/package/odb/0010-Add-initial-support-for-GCC-9.patch b/package/odb/0010-Add-initial-support-for-GCC-9.patch
new file mode 100644
index 0000000000..4d157bb901
--- /dev/null
+++ b/package/odb/0010-Add-initial-support-for-GCC-9.patch
@@ -0,0 +1,232 @@
+From cd9a15f42ef35449a8ad480352f9f5495eb37c30 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Fri, 15 Mar 2019 17:37:28 +0200
+Subject: [PATCH 10/10] Add initial support for GCC 9
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ odb/cxx-lexer.cxx | 33 +++++++++++++++++++++++++++------
+ odb/gcc.hxx       | 32 ++++++++++++++++++++++++++++++++
+ odb/include.cxx   |  3 +++
+ odb/plugin.cxx    | 45 ++++++++++++++++++++++++++++++---------------
+ 4 files changed, 92 insertions(+), 21 deletions(-)
+
+diff --git a/odb/cxx-lexer.cxx b/odb/cxx-lexer.cxx
+index cfebbb5..acd13be 100644
+--- a/odb/cxx-lexer.cxx
++++ b/odb/cxx-lexer.cxx
+@@ -143,12 +143,20 @@ translate ()
+ // Diagnostics callback.
+ //
+ extern "C" bool
+-cpp_error_callback (
++cpp_diagnostic_callback (
+   cpp_reader* reader,
++#if BUILDING_GCC_MAJOR >= 9
++  cpp_diagnostic_level level,
++#else
+   int level,
++#endif
+ #if BUILDING_GCC_MAJOR > 4 || BUILDING_GCC_MAJOR == 4 && BUILDING_GCC_MINOR > 5
++#if BUILDING_GCC_MAJOR >= 9
++  cpp_warning_reason,
++#else
+   int /*reason*/, // Added in GCC 4.6.0.
+ #endif
++#endif
+ #if BUILDING_GCC_MAJOR <= 5
+   location_t,
+   unsigned int,
+@@ -185,10 +193,14 @@ cpp_error_callback (
+     vfprintf (stderr, msg, *ap);
+     fprintf (stderr, "\n");
+ 
+-    // By resetting the error callback we indicate to cxx_string_lexer
+-    // that there was an error.
++    // By resetting the callback we indicate to cxx_string_lexer that there
++    // was an error.
+     //
++#if BUILDING_GCC_MAJOR >= 9
++    cpp_get_callbacks (reader)->diagnostic = 0;
++#else
+     cpp_get_callbacks (reader)->error = 0;
++#endif
+     return true;
+   }
+ 
+@@ -247,7 +259,12 @@ start (string const& data)
+   // The previous lexing session should have popped the buffer.
+   //
+   assert (cpp_get_buffer (reader_) == 0);
+-  callbacks_->error = &cpp_error_callback;
++
++#if BUILDING_GCC_MAJOR >= 9
++  callbacks_->diagnostic = &cpp_diagnostic_callback;
++#else
++  callbacks_->error = &cpp_diagnostic_callback;
++#endif
+ 
+   data_ = data;
+   buf_ = data;
+@@ -267,10 +284,14 @@ next (string& token, tree* node)
+   token.clear ();
+   cpp_token const* t (cpp_get_token (reader_));
+ 
+-  // If there was an error, the error callback will be reset to 0.
+-  // Diagnostics has already been issued.
++  // If there was an error, the callback will be reset to 0. Diagnostics has
++  // already been issued.
+   //
++#if BUILDING_GCC_MAJOR >= 9
++  if (callbacks_->diagnostic == 0)
++#else
+   if (callbacks_->error == 0)
++#endif
+     throw invalid_input ();
+ 
+   cpp_ttype tt (t->type);
+diff --git a/odb/gcc.hxx b/odb/gcc.hxx
+index a22357d..0304192 100644
+--- a/odb/gcc.hxx
++++ b/odb/gcc.hxx
+@@ -158,4 +158,36 @@ gcc_tree_code_name (gcc_tree_code_type tc) {return tree_code_name[tc];}
+ #  define anon_aggrname_p(X) ANON_AGGRNAME_P(X)
+ #endif
+ 
++// In GCC 9:
++//
++// INCLUDED_FROM     Became linemap_included_from_linemap().
++// LAST_SOURCE_LINE  Was removed apparently as no longer used. Studying
++//                   the line-map.h diff from 8.3 suggests that the old
++//                   implementation should still work.
++//
++#if BUILDING_GCC_MAJOR >= 9
++
++inline const line_map_ordinary*
++INCLUDED_FROM (line_maps* set, const line_map_ordinary* map)
++{
++  return linemap_included_from_linemap (set, map);
++}
++
++inline source_location
++LAST_SOURCE_LINE_LOCATION (const line_map_ordinary* map)
++{
++  return (((map[1].start_location - 1
++	    - map->start_location)
++	   & ~((1 << map->m_column_and_range_bits) - 1))
++	  + map->start_location);
++}
++
++inline linenum_type
++LAST_SOURCE_LINE (const line_map_ordinary* map)
++{
++  return SOURCE_LINE (map, LAST_SOURCE_LINE_LOCATION (map));
++}
++
++#endif
++
+ #endif // ODB_GCC_HXX
+diff --git a/odb/include.cxx b/odb/include.cxx
+index 08c93ce..0082f5e 100644
+--- a/odb/include.cxx
++++ b/odb/include.cxx
+@@ -584,6 +584,9 @@ namespace
+ 
+     for (include_map::iterator i (imap.begin ()), e (imap.end ()); i != e; ++i)
+     {
++      // Note that the LAST_SOURCE_LINE value of a map that includes another
++      // map is the line of that include.
++
+       /*
+       cerr << endl
+            << i->first << " included from" << endl;
+diff --git a/odb/plugin.cxx b/odb/plugin.cxx
+index 0fac632..892f27c 100644
+--- a/odb/plugin.cxx
++++ b/odb/plugin.cxx
+@@ -44,10 +44,15 @@ paths profile_paths_;
+ path file_;    // File being compiled.
+ paths inputs_; // List of input files in at-once mode or just file_.
+ 
+-bool (*cpp_error_prev) (
++bool (*cpp_diagnostic_prev) (
+   cpp_reader*,
++#if BUILDING_GCC_MAJOR >= 9
++  cpp_diagnostic_level,
++  cpp_warning_reason,
++#else
+   int,
+   int,
++#endif
+ #if BUILDING_GCC_MAJOR >= 6
+   rich_location*,
+ #else
+@@ -58,17 +63,22 @@ bool (*cpp_error_prev) (
+   va_list*);
+ 
+ static bool
+-cpp_error_filter (cpp_reader* r,
+-                  int level,
+-                  int reason,
++cpp_diagnostic_filter (cpp_reader* r,
++#if BUILDING_GCC_MAJOR >= 9
++                       cpp_diagnostic_level level,
++                       cpp_warning_reason reason,
++#else
++                       int level,
++                       int reason,
++#endif
+ #if BUILDING_GCC_MAJOR >= 6
+-                  rich_location* l,
++                       rich_location* l,
+ #else
+-                  location_t l,
+-                  unsigned int column_override,
++                       location_t l,
++                       unsigned int column_override,
+ #endif
+-                  const char* msg,
+-                  va_list* ap)
++                       const char* msg,
++                       va_list* ap)
+ {
+   // #pragma once in the main file. Note that the message that we get is
+   // potentially translated so we search for the substring (there is
+@@ -80,7 +90,7 @@ cpp_error_filter (cpp_reader* r,
+   if (strstr (msg, "#pragma once") != 0)
+     return true;
+ 
+-  return cpp_error_prev (
++  return cpp_diagnostic_prev (
+     r,
+     level,
+     reason,
+@@ -119,15 +129,20 @@ start_unit_callback (void*, void*)
+   //
+   cpp_callbacks* cb (cpp_get_callbacks (parse_in));
+ 
+-  if (cb->error == 0)
++#if BUILDING_GCC_MAJOR >= 9
++  cpp_diagnostic_prev = cb->diagnostic;
++  cb->diagnostic = &cpp_diagnostic_filter;
++#else
++  cpp_diagnostic_prev = cb->error;
++  cb->error = &cpp_diagnostic_filter;
++#endif
++
++  if (cpp_diagnostic_prev == 0)
+   {
+-    cerr << "ice: expected cpp error callback to be set" << endl;
++    cerr << "ice: expected cpp diagnostic callback to be set" << endl;
+     exit (1);
+   }
+ 
+-  cpp_error_prev = cb->error;
+-  cb->error = &cpp_error_filter;
+-
+   // Set the directory of the main file (stdin) to that of the orginal
+   // file so that relative inclusion works. Also adjust the path and
+   // re-stat the file so that #pragma once works.
+-- 
+2.25.0
+
diff --git a/package/odb/Config.in.host b/package/odb/Config.in.host
new file mode 100644
index 0000000000..e45677095c
--- /dev/null
+++ b/package/odb/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_ODB
+	bool "host-odb"
+	select BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
+	help
+	  This is a compiler that takes a specially crafted c++ header
+	  file and auto-generates a schema that works with libodb and
+	  the subsequent libodb-database library.
diff --git a/package/odb/odb.hash b/package/odb/odb.hash
new file mode 100644
index 0000000000..773a9c829b
--- /dev/null
+++ b/package/odb/odb.hash
@@ -0,0 +1,6 @@
+# From https://www.codesynthesis.com/products/odb/download.xhtml
+sha1	810fc02e591429ed19f5a2699d144fb611fb121b	odb-2.4.0.tar.bz2
+
+# Locally computed
+sha256	6785154fa98ea3977c8c2ab38cec16c4aa78c2c2039e80cd2908347b1c1d4198	odb-2.4.0.tar.bz2
+sha256	7983b82cb1f1686ac2b55420ded9c0f348f93dd17bf3e048ae3b25c1da51b80e	LICENSE
diff --git a/package/odb/odb.mk b/package/odb/odb.mk
new file mode 100644
index 0000000000..11086471e6
--- /dev/null
+++ b/package/odb/odb.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# odb
+#
+################################################################################
+
+ODB_VERSION_MAJOR = 2.4
+ODB_VERSION = $(ODB_VERSION_MAJOR).0
+ODB_SOURCE = odb-$(ODB_VERSION).tar.bz2
+ODB_SITE = https://www.codesynthesis.com/download/odb/$(ODB_VERSION_MAJOR)
+ODB_LICENSE = GPL-3.0
+ODB_LICENSE_FILES = LICENSE
+HOST_ODB_DEPENDENCIES = host-libcutl
+
+# Prevent odb from trying to install the gcc plugin into the hosts
+# gcc plugin directory. Instead, this will install the gcc plugin
+# into host/libexec/odb
+HOST_ODB_CONF_OPTS = --with-gcc-plugin-dir=no
+
+$(eval $(host-autotools-package))
diff --git a/package/odb/series b/package/odb/series
new file mode 100644
index 0000000000..d41253abf9
--- /dev/null
+++ b/package/odb/series
@@ -0,0 +1,10 @@
+0001-no-need-of-tm.h.patch
+0002-Remove-gratuitous-classes.patch
+0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
+0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
+0005-Fix-bug-in-GCC-6-input_location-translation.patch
+0006-Adapt-to-changes-in-GCC-8.patch
+0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
+0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
+0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
+0010-Add-initial-support-for-GCC-9.patch
-- 
2.25.0
