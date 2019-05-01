From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  1 May 2019 14:40:27 -0500
Subject: [Buildroot] [PATCH v7 0/5] Compiler-rt Security Fuzzing Support
Message-ID: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds the ability to perform security fuzzing on
target for custom applications as well as against other open
source projects which have existing libfuzzer frameworks.

What is Fuzzing?

"Fuzz testing or fuzzing is a software testing technique, often
automated or semi-automated, that involves providing invalid,
unexpected, or random data to the inputs of a computer program.
The program is then monitored for exceptions such as crashes, or
failing built-in code assertions or for finding potential memory
Leaks.? - Wikipedia

Compiler-RT's Libfuzzer - https://llvm.org/docs/LibFuzzer.html
Works at the software level like a unit or component test
- Target is code rather than system interface
- Specifically for C and C++
Catch bugs sooner in the development cycle
- Testing can begin before software is fully integrated
Evolutionary fuzzer
- No structural data modeling required
- Uses code coverage of a test case to compute fitness score
  in evolutionary algorithm

Sanitizers
- Dynamic analysis tools designed to look for runtime errors
- The sanitizers in this series are built with debug symbols
  and will point to the exact line of code where the error
  occurs. Sanitizers can be used with both GCC and CLANG.
   Address Sanitizer
    -fsanitize=address
   Leak Sanitizer
    -fsanitize=leak
   Undefined behavior Sanitizer
    -fsanitize=undefined
   Thread Sanitizer
    -fsanitize=thread


Matt Weber (5):
  package/llvm: install target binary/debug tools
  package llvm/clang: note about version bumping dep
  package/llvm: disable libxml2
  package/compiler-rt: new package
  testing/tests: CLANG compiler-rt runtime test

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/clang/clang.mk                        |  1 +
 package/compiler-rt/Config.in                 | 14 ++++++
 package/compiler-rt/compiler-rt.hash          |  3 ++
 package/compiler-rt/compiler-rt.mk            | 36 +++++++++++++++
 package/llvm/llvm.mk                          | 17 ++++++-
 .../br2-external/clang-compiler-rt/Config.in  |  1 +
 .../clang-compiler-rt/external.desc           |  1 +
 .../clang-compiler-rt/external.mk             |  1 +
 .../package/libfuzzer/Config.in               |  7 +++
 .../package/libfuzzer/libfuzzer.hash          |  2 +
 .../package/libfuzzer/libfuzzer.mk            | 24 ++++++++++
 support/testing/tests/package/test_clang.py   | 46 +++++++++++++++++++
 15 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 package/compiler-rt/Config.in
 create mode 100644 package/compiler-rt/compiler-rt.hash
 create mode 100644 package/compiler-rt/compiler-rt.mk
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/external.desc
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/external.mk
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
 create mode 100644 support/testing/tests/package/test_clang.py

-- 
2.17.1
