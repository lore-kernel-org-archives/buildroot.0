From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 10 Oct 2013 12:11:05 +0200
Subject: [Buildroot] make-4.0
Message-ID: <CAB0FRstfgMy3c2t1uUfdkusX8XzwF85CXodwyzVtZ4w6aN-QtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU make 4.0 has been released (see
http://savannah.gnu.org/forum/forum.php?forum_id=7749).
This version introduces only 1 backward-incompatibility (instead of 7
with version 3.82).
See below, an extracted part of the file NEWS.

Fran?ois

--8<-------- details from NEWS --------

Version 4.0 (09 Oct 2013)

A complete list of bugs fixed in this version is available here:

http://sv.gnu.org/bugs/index.php?group=make&report_id=111&fix_release_id=101&set=custom

* WARNING: Backward-incompatibility!
  If .POSIX is specified, then make adheres to the POSIX backslash/newline
  handling requirements, which introduces the following changes to the
  standard backslash/newline handling in non-recipe lines:
  * Any trailing space before the backslash is preserved
  * Each backslash/newline (plus subsequent whitespace) is converted to a
    single space

* New feature: GNU Guile integration
  This version of GNU make can be compiled with GNU Guile integration.
  GNU Guile serves as an embedded extension language for make.
  See the "Guile Function" section in the GNU Make manual for details.
  Currently GNU Guile 1.8 and 2.0+ are supported.  In Guile 1.8 there is no
  support for internationalized character sets.  In Guile 2.0+, scripts can be
  encoded in UTF-8.

* New command line option: --output-sync (-O) enables grouping of output by
  target or by recursive make.  This is useful during parallel builds to avoid
  mixing output from different jobs together giving hard-to-understand
  results.  Original implementation by David Boyce <dsb@boyski.com>.
  Reworked and enhanced by Frank Heckenbach <f.heckenbach@fh-soft.de>.
  Windows support by Eli Zaretskii <eliz@gnu.org>.

* New command line option: --trace enables tracing of targets.  When enabled
  the recipe to be invoked is printed even if it would otherwise be suppressed
  by .SILENT or a "@" prefix character.  Also before each recipe is run the
  makefile name and linenumber where it was defined are shown as well as the
  prerequisites that caused the target to be considered out of date.

* New command line option argument: --debug now accepts a "n" (none) flag
  which disables all debugging settings that are currently enabled.

* New feature: The "job server" capability is now supported on Windows.
  Implementation contributed by Troy Runkel <Troy.Runkel@mathworks.com>

* New feature: The .ONESHELL capability is now supported on Windows.  Support
  added by Eli Zaretskii <eliz@gnu.org>.

* New feature: "!=" shell assignment operator as an alternative to the
  $(shell ...) function.  Implemented for compatibility with BSD makefiles.
  Note there are subtle differences between "!=" and $(shell ...).  See the
  description in the GNU make manual.
  WARNING: Backward-incompatibility!
  Variables ending in "!" previously defined as "variable!= value" will now be
  interpreted as shell assignment.  Change your assignment to add whitespace
  between the "!" and "=": "variable! = value"

* New feature: "::=" simple assignment operator as defined by POSIX in 2012.
  This operator has identical functionality to ":=" in GNU make, but will be
  portable to any implementation of make conforming to a sufficiently new
  version of POSIX (see http://austingroupbugs.net/view.php?id=330).  It is
  not necessary to define the .POSIX target to access this operator.

* New feature: Loadable objects
  This version of GNU make contains a "technology preview": the ability to
  load dynamic objects into the make runtime.  These objects can be created by
  the user and can add extended functionality, usable by makefiles.

* New function: $(file ...) writes to a file.

* New variable: $(GNUMAKEFLAGS) will be parsed for make flags, just like
  MAKEFLAGS is.  It can be set in the environment or the makefile, containing
  GNU make-specific flags to allow your makefile to be portable to other
  versions of make.  Once this variable is parsed, GNU make will set it to the
  empty string so that flags will not be duplicated on recursion.

* New variable: `MAKE_HOST' gives the name of the host architecture
  make was compiled for.  This is the same value you see after 'Built for'
  when running 'make --version'.

* Behavior of MAKEFLAGS and MFLAGS is more rigorously defined.  All simple
  flags are grouped together in the first word of MAKEFLAGS.  No options that
  accept arguments appear in the first word.  If no simple flags are present
  MAKEFLAGS begins with a space.  Flags with both short and long versions
  always use the short versions in MAKEFLAGS.  Flags are listed in
  alphabetical order using ASCII ordering.  MFLAGS never begins with "- ".

* Setting the -r and -R options in MAKEFLAGS inside a makefile now works as
  expected, removing all built-in rules and variables, respectively.

* If a recipe fails, the makefile name and linenumber of the recipe are shown.

* A .RECIPEPREFIX setting is remembered per-recipe and variables expanded
  in that recipe also use that recipe prefix setting.

* In -p output, .RECIPEPREFIX settings are shown and all target-specific
  variables are output as if in a makefile, instead of as comments.

* On MS-Windows, recipes that use ".." quoting will no longer force
  invocation of commands via temporary batch files and stock Windows
  shells, they will be short-circuited and invoked directly.  (In
  other words, " is no longer a special character for stock Windows
  shells.)  This avoids hitting shell limits for command length when
  quotes are used, but nothing else in the command requires the shell.
  This change could potentially mean some minor incompatibilities in
  behavior when the recipe uses quoted string on shell command lines.

Version 3.82 (28 Jul 2010)

A complete list of bugs fixed in this version is available here:

http://sv.gnu.org/bugs/index.php?group=make&report_id=111&fix_release_id=104&set=custom

* Compiling GNU make now requires a conforming ISO C 1989 compiler and
  standard runtime library.

* WARNING: Backward-incompatibility!
  The POSIX standard for make was changed in the 2008 version in a
  fundamentally incompatible way: make is required to invoke the shell as if
  the '-e' flag were provided.  Because this would break many makefiles that
  have been written to conform to the original text of the standard, the
  default behavior of GNU make remains to invoke the shell with simply '-c'.
  However, any makefile specifying the .POSIX special target will follow the
  new POSIX standard and pass '-e' to the shell.  See also .SHELLFLAGS
  below.

* WARNING: Backward-incompatibility!
  The '$?' variable now contains all prerequisites that caused the target to
  be considered out of date, even if they do not exist (previously only
  existing targets were provided in $?).

* WARNING: Backward-incompatibility!
  Wildcards were not documented as returning sorted values, but the results
  have been sorted up until this release..  If your makefiles require sorted
  results from wildcard expansions, use the $(sort ...)  function to request
  it explicitly.

* WARNING: Backward-incompatibility!
  In previous versions of make it was acceptable to list one or more explicit
  targets followed by one or more pattern targets in the same rule and it
  worked "as expected".  However, this was not documented as acceptable and if
  you listed any explicit targets AFTER the pattern targets, the entire rule
  would be mis-parsed.  This release removes this ability completely: make
  will generate an error message if you mix explicit and pattern targets in
  the same rule.

* WARNING: Backward-incompatibility!
  As a result of parser enhancements, three backward-compatibility issues
  exist: first, a prerequisite containing an "=" cannot be escaped with a
  backslash any longer.  You must create a variable containing an "=" and
  use that variable in the prerequisite.  Second, variable names can no
  longer contain whitespace, unless you put the whitespace in a variable and
  use the variable.  Third, in previous versions of make it was sometimes
  not flagged as an error for explicit and pattern targets to appear in the
  same rule.  Now this is always reported as an error.

* WARNING: Backward-incompatibility!
  The pattern-specific variables and pattern rules are now applied in the
  shortest stem first order instead of the definition order (variables
  and rules with the same stem length are still applied in the definition
  order). This produces the usually-desired behavior where more specific
  patterns are preferred. To detect this feature search for 'shortest-stem'
  in the .FEATURES special variable.

* WARNING: Backward-incompatibility!
  The library search behavior has changed to be compatible with the standard
  linker behavior. Prior to this version for prerequisites specified using
  the -lfoo syntax make first searched for libfoo.so in the current
  directory, vpath directories, and system directories. If that didn't yield
  a match, make then searched for libfoo.a in these directories. Starting
  with this version make searches first for libfoo.so and then for libfoo.a
  in each of these directories in order.

* New command line option: --eval=STRING causes STRING to be evaluated as
  makefile syntax (akin to using the $(eval ...) function).  The evaluation
  is performed after all default rules and variables are defined, but before
  any makefiles are read.

* New special variable: .RECIPEPREFIX allows you to reset the recipe
  introduction character from the default (TAB) to something else.  The
  first character of this variable value is the new recipe introduction
  character.  If the variable is set to the empty string, TAB is used again.
  It can be set and reset at will; recipes will use the value active when
  they were first parsed.  To detect this feature check the value of
  $(.RECIPEPREFIX).

* New special variable: .SHELLFLAGS allows you to change the options passed
  to the shell when it invokes recipes.  By default the value will be "-c"
  (or "-ec" if .POSIX is set).

* New special target: .ONESHELL instructs make to invoke a single instance
  of the shell and provide it with the entire recipe, regardless of how many
  lines it contains.  As a special feature to allow more straightforward
  conversion of makefiles to use .ONESHELL, any recipe line control
  characters ('@', '+', or '-') will be removed from the second and
  subsequent recipe lines.  This happens _only_ if the SHELL value is deemed
  to be a standard POSIX-style shell.  If not, then no interior line control
  characters are removed (as they may be part of the scripting language used
  with the alternate SHELL).

* New variable modifier 'private': prefixing a variable assignment with the
  modifier 'private' suppresses inheritance of that variable by
  prerequisites.  This is most useful for target- and pattern-specific
  variables.

* New make directive: 'undefine' allows you to undefine a variable so that
  it appears as if it was never set. Both $(flavor) and $(origin) functions
  will return 'undefined' for such a variable. To detect this feature search
  for 'undefine' in the .FEATURES special variable.

* The parser for variable assignments has been enhanced to allow multiple
  modifiers ('export', 'override', 'private') on the same line as variables,
  including define/endef variables, and in any order.  Also, it is possible
  to create variables and targets named as these modifiers.

* The 'define' make directive now allows a variable assignment operator
  after the variable name, to allow for simple, conditional, or appending
  multi-line variable assignment.
