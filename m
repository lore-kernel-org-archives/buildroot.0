From: Christian Stewart <christian@paral.in>
Date: Sat, 16 Mar 2019 18:21:40 -0700
Subject: [Buildroot] [RFC PATCH v1 4/6] docker-cli: upgrade to go modules
In-Reply-To: <20190317012142.10545-1-christian@paral.in>
References: <20190317012142.10545-1-christian@paral.in>
Message-ID: <20190317012142.10545-4-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces go.mod and go.sum files derived from the vendor.conf in
the upstream Docker cli repository.

Replace directives are added to indicate the correct version of docker/engine to
pull in. Additionally, a patch is added to bring in the upstream modifications
to the vendored spf13/pflag package.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...ude-modified-package-under-thirdpart.patch | 5259 +++++++++++++++++
 package/docker-cli/docker-cli.mk              |    3 +-
 package/docker-cli/go.mod                     |  127 +
 package/docker-cli/go.sum                     |  419 ++
 4 files changed, 5806 insertions(+), 2 deletions(-)
 create mode 100644 package/docker-cli/0001-spf13-pflag-include-modified-package-under-thirdpart.patch
 create mode 100644 package/docker-cli/go.mod
 create mode 100644 package/docker-cli/go.sum

diff --git a/package/docker-cli/0001-spf13-pflag-include-modified-package-under-thirdpart.patch b/package/docker-cli/0001-spf13-pflag-include-modified-package-under-thirdpart.patch
new file mode 100644
index 0000000000..22ba7cb7af
--- /dev/null
+++ b/package/docker-cli/0001-spf13-pflag-include-modified-package-under-thirdpart.patch
@@ -0,0 +1,5259 @@
+From c46c6786948f8a183ca3e0717e5a8a258c845712 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sat, 16 Mar 2019 17:19:43 -0700
+Subject: [PATCH] spf13/pflag: include modified package under thirdparty
+
+The Docker upstream codebase has a vendored version of spf13/goflag with in-tree
+modifications. The modifications add a IPNetSliceVar to pflag.FlagSet.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ thirdparty/pflag/LICENSE             |   28 +
+ thirdparty/pflag/README.md           |  296 +++++++
+ thirdparty/pflag/bool.go             |   94 ++
+ thirdparty/pflag/bool_slice.go       |  147 ++++
+ thirdparty/pflag/bytes.go            |  209 +++++
+ thirdparty/pflag/count.go            |   96 ++
+ thirdparty/pflag/duration.go         |   86 ++
+ thirdparty/pflag/duration_slice.go   |  128 +++
+ thirdparty/pflag/flag.go             | 1224 ++++++++++++++++++++++++++
+ thirdparty/pflag/float32.go          |   88 ++
+ thirdparty/pflag/float64.go          |   84 ++
+ thirdparty/pflag/go.mod              |    3 +
+ thirdparty/pflag/golangflag.go       |  105 +++
+ thirdparty/pflag/int.go              |   84 ++
+ thirdparty/pflag/int16.go            |   88 ++
+ thirdparty/pflag/int32.go            |   88 ++
+ thirdparty/pflag/int64.go            |   84 ++
+ thirdparty/pflag/int8.go             |   88 ++
+ thirdparty/pflag/int_slice.go        |  128 +++
+ thirdparty/pflag/ip.go               |   94 ++
+ thirdparty/pflag/ip_slice.go         |  148 ++++
+ thirdparty/pflag/ipmask.go           |  122 +++
+ thirdparty/pflag/ipnet.go            |   98 +++
+ thirdparty/pflag/ipnet_slice.go      |  147 ++++
+ thirdparty/pflag/string.go           |   80 ++
+ thirdparty/pflag/string_array.go     |  103 +++
+ thirdparty/pflag/string_slice.go     |  149 ++++
+ thirdparty/pflag/string_to_int.go    |  149 ++++
+ thirdparty/pflag/string_to_string.go |  160 ++++
+ thirdparty/pflag/uint.go             |   88 ++
+ thirdparty/pflag/uint16.go           |   88 ++
+ thirdparty/pflag/uint32.go           |   88 ++
+ thirdparty/pflag/uint64.go           |   88 ++
+ thirdparty/pflag/uint8.go            |   88 ++
+ thirdparty/pflag/uint_slice.go       |  126 +++
+ 35 files changed, 4964 insertions(+)
+ create mode 100644 thirdparty/pflag/LICENSE
+ create mode 100644 thirdparty/pflag/README.md
+ create mode 100644 thirdparty/pflag/bool.go
+ create mode 100644 thirdparty/pflag/bool_slice.go
+ create mode 100644 thirdparty/pflag/bytes.go
+ create mode 100644 thirdparty/pflag/count.go
+ create mode 100644 thirdparty/pflag/duration.go
+ create mode 100644 thirdparty/pflag/duration_slice.go
+ create mode 100644 thirdparty/pflag/flag.go
+ create mode 100644 thirdparty/pflag/float32.go
+ create mode 100644 thirdparty/pflag/float64.go
+ create mode 100644 thirdparty/pflag/go.mod
+ create mode 100644 thirdparty/pflag/golangflag.go
+ create mode 100644 thirdparty/pflag/int.go
+ create mode 100644 thirdparty/pflag/int16.go
+ create mode 100644 thirdparty/pflag/int32.go
+ create mode 100644 thirdparty/pflag/int64.go
+ create mode 100644 thirdparty/pflag/int8.go
+ create mode 100644 thirdparty/pflag/int_slice.go
+ create mode 100644 thirdparty/pflag/ip.go
+ create mode 100644 thirdparty/pflag/ip_slice.go
+ create mode 100644 thirdparty/pflag/ipmask.go
+ create mode 100644 thirdparty/pflag/ipnet.go
+ create mode 100644 thirdparty/pflag/ipnet_slice.go
+ create mode 100644 thirdparty/pflag/string.go
+ create mode 100644 thirdparty/pflag/string_array.go
+ create mode 100644 thirdparty/pflag/string_slice.go
+ create mode 100644 thirdparty/pflag/string_to_int.go
+ create mode 100644 thirdparty/pflag/string_to_string.go
+ create mode 100644 thirdparty/pflag/uint.go
+ create mode 100644 thirdparty/pflag/uint16.go
+ create mode 100644 thirdparty/pflag/uint32.go
+ create mode 100644 thirdparty/pflag/uint64.go
+ create mode 100644 thirdparty/pflag/uint8.go
+ create mode 100644 thirdparty/pflag/uint_slice.go
+
+diff --git a/thirdparty/pflag/LICENSE b/thirdparty/pflag/LICENSE
+new file mode 100644
+index 00000000..63ed1cfe
+--- /dev/null
++++ b/thirdparty/pflag/LICENSE
+@@ -0,0 +1,28 @@
++Copyright (c) 2012 Alex Ogier. All rights reserved.
++Copyright (c) 2012 The Go Authors. All rights reserved.
++
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions are
++met:
++
++   * Redistributions of source code must retain the above copyright
++notice, this list of conditions and the following disclaimer.
++   * Redistributions in binary form must reproduce the above
++copyright notice, this list of conditions and the following disclaimer
++in the documentation and/or other materials provided with the
++distribution.
++   * Neither the name of Google Inc. nor the names of its
++contributors may be used to endorse or promote products derived from
++this software without specific prior written permission.
++
++THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
++A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
++OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+diff --git a/thirdparty/pflag/README.md b/thirdparty/pflag/README.md
+new file mode 100644
+index 00000000..b052414d
+--- /dev/null
++++ b/thirdparty/pflag/README.md
+@@ -0,0 +1,296 @@
++[![Build Status](https://travis-ci.org/spf13/pflag.svg?branch=master)](https://travis-ci.org/spf13/pflag)
++[![Go Report Card](https://goreportcard.com/badge/github.com/spf13/pflag)](https://goreportcard.com/report/github.com/spf13/pflag)
++[![GoDoc](https://godoc.org/github.com/spf13/pflag?status.svg)](https://godoc.org/github.com/spf13/pflag)
++
++## Description
++
++pflag is a drop-in replacement for Go's flag package, implementing
++POSIX/GNU-style --flags.
++
++pflag is compatible with the [GNU extensions to the POSIX recommendations
++for command-line options][1]. For a more precise description, see the
++"Command-line flag syntax" section below.
++
++[1]: http://www.gnu.org/software/libc/manual/html_node/Argument-Syntax.html
++
++pflag is available under the same style of BSD license as the Go language,
++which can be found in the LICENSE file.
++
++## Installation
++
++pflag is available using the standard `go get` command.
++
++Install by running:
++
++    go get github.com/spf13/pflag
++
++Run tests by running:
++
++    go test github.com/spf13/pflag
++
++## Usage
++
++pflag is a drop-in replacement of Go's native flag package. If you import
++pflag under the name "flag" then all code should continue to function
++with no changes.
++
++``` go
++import flag "github.com/spf13/pflag"
++```
++
++There is one exception to this: if you directly instantiate the Flag struct
++there is one more field "Shorthand" that you will need to set.
++Most code never instantiates this struct directly, and instead uses
++functions such as String(), BoolVar(), and Var(), and is therefore
++unaffected.
++
++Define flags using flag.String(), Bool(), Int(), etc.
++
++This declares an integer flag, -flagname, stored in the pointer ip, with type *int.
++
++``` go
++var ip *int = flag.Int("flagname", 1234, "help message for flagname")
++```
++
++If you like, you can bind the flag to a variable using the Var() functions.
++
++``` go
++var flagvar int
++func init() {
++    flag.IntVar(&flagvar, "flagname", 1234, "help message for flagname")
++}
++```
++
++Or you can create custom flags that satisfy the Value interface (with
++pointer receivers) and couple them to flag parsing by
++
++``` go
++flag.Var(&flagVal, "name", "help message for flagname")
++```
++
++For such flags, the default value is just the initial value of the variable.
++
++After all flags are defined, call
++
++``` go
++flag.Parse()
++```
++
++to parse the command line into the defined flags.
++
++Flags may then be used directly. If you're using the flags themselves,
++they are all pointers; if you bind to variables, they're values.
++
++``` go
++fmt.Println("ip has value ", *ip)
++fmt.Println("flagvar has value ", flagvar)
++```
++
++There are helpers function to get values later if you have the FlagSet but
++it was difficult to keep up with all of the flag pointers in your code.
++If you have a pflag.FlagSet with a flag called 'flagname' of type int you
++can use GetInt() to get the int value. But notice that 'flagname' must exist
++and it must be an int. GetString("flagname") will fail.
++
++``` go
++i, err := flagset.GetInt("flagname")
++```
++
++After parsing, the arguments after the flag are available as the
++slice flag.Args() or individually as flag.Arg(i).
++The arguments are indexed from 0 through flag.NArg()-1.
++
++The pflag package also defines some new functions that are not in flag,
++that give one-letter shorthands for flags. You can use these by appending
++'P' to the name of any function that defines a flag.
++
++``` go
++var ip = flag.IntP("flagname", "f", 1234, "help message")
++var flagvar bool
++func init() {
++	flag.BoolVarP(&flagvar, "boolname", "b", true, "help message")
++}
++flag.VarP(&flagVal, "varname", "v", "help message")
++```
++
++Shorthand letters can be used with single dashes on the command line.
++Boolean shorthand flags can be combined with other shorthand flags.
++
++The default set of command-line flags is controlled by
++top-level functions.  The FlagSet type allows one to define
++independent sets of flags, such as to implement subcommands
++in a command-line interface. The methods of FlagSet are
++analogous to the top-level functions for the command-line
++flag set.
++
++## Setting no option default values for flags
++
++After you create a flag it is possible to set the pflag.NoOptDefVal for
++the given flag. Doing this changes the meaning of the flag slightly. If
++a flag has a NoOptDefVal and the flag is set on the command line without
++an option the flag will be set to the NoOptDefVal. For example given:
++
++``` go
++var ip = flag.IntP("flagname", "f", 1234, "help message")
++flag.Lookup("flagname").NoOptDefVal = "4321"
++```
++
++Would result in something like
++
++| Parsed Arguments | Resulting Value |
++| -------------    | -------------   |
++| --flagname=1357  | ip=1357         |
++| --flagname       | ip=4321         |
++| [nothing]        | ip=1234         |
++
++## Command line flag syntax
++
++```
++--flag    // boolean flags, or flags with no option default values
++--flag x  // only on flags without a default value
++--flag=x
++```
++
++Unlike the flag package, a single dash before an option means something
++different than a double dash. Single dashes signify a series of shorthand
++letters for flags. All but the last shorthand letter must be boolean flags
++or a flag with a default value
++
++```
++// boolean or flags where the 'no option default value' is set
++-f
++-f=true
++-abc
++but
++-b true is INVALID
++
++// non-boolean and flags without a 'no option default value'
++-n 1234
++-n=1234
++-n1234
++
++// mixed
++-abcs "hello"
++-absd="hello"
++-abcs1234
++```
++
++Flag parsing stops after the terminator "--". Unlike the flag package,
++flags can be interspersed with arguments anywhere on the command line
++before this terminator.
++
++Integer flags accept 1234, 0664, 0x1234 and may be negative.
++Boolean flags (in their long form) accept 1, 0, t, f, true, false,
++TRUE, FALSE, True, False.
++Duration flags accept any input valid for time.ParseDuration.
++
++## Mutating or "Normalizing" Flag names
++
++It is possible to set a custom flag name 'normalization function.' It allows flag names to be mutated both when created in the code and when used on the command line to some 'normalized' form. The 'normalized' form is used for comparison. Two examples of using the custom normalization func follow.
++
++**Example #1**: You want -, _, and . in flags to compare the same. aka --my-flag == --my_flag == --my.flag
++
++``` go
++func wordSepNormalizeFunc(f *pflag.FlagSet, name string) pflag.NormalizedName {
++	from := []string{"-", "_"}
++	to := "."
++	for _, sep := range from {
++		name = strings.Replace(name, sep, to, -1)
++	}
++	return pflag.NormalizedName(name)
++}
++
++myFlagSet.SetNormalizeFunc(wordSepNormalizeFunc)
++```
++
++**Example #2**: You want to alias two flags. aka --old-flag-name == --new-flag-name
++
++``` go
++func aliasNormalizeFunc(f *pflag.FlagSet, name string) pflag.NormalizedName {
++	switch name {
++	case "old-flag-name":
++		name = "new-flag-name"
++		break
++	}
++	return pflag.NormalizedName(name)
++}
++
++myFlagSet.SetNormalizeFunc(aliasNormalizeFunc)
++```
++
++## Deprecating a flag or its shorthand
++It is possible to deprecate a flag, or just its shorthand. Deprecating a flag/shorthand hides it from help text and prints a usage message when the deprecated flag/shorthand is used.
++
++**Example #1**: You want to deprecate a flag named "badflag" as well as inform the users what flag they should use instead.
++```go
++// deprecate a flag by specifying its name and a usage message
++flags.MarkDeprecated("badflag", "please use --good-flag instead")
++```
++This hides "badflag" from help text, and prints `Flag --badflag has been deprecated, please use --good-flag instead` when "badflag" is used.
++
++**Example #2**: You want to keep a flag name "noshorthandflag" but deprecate its shortname "n".
++```go
++// deprecate a flag shorthand by specifying its flag name and a usage message
++flags.MarkShorthandDeprecated("noshorthandflag", "please use --noshorthandflag only")
++```
++This hides the shortname "n" from help text, and prints `Flag shorthand -n has been deprecated, please use --noshorthandflag only` when the shorthand "n" is used.
++
++Note that usage message is essential here, and it should not be empty.
++
++## Hidden flags
++It is possible to mark a flag as hidden, meaning it will still function as normal, however will not show up in usage/help text.
++
++**Example**: You have a flag named "secretFlag" that you need for internal use only and don't want it showing up in help text, or for its usage text to be available.
++```go
++// hide a flag by specifying its name
++flags.MarkHidden("secretFlag")
++```
++
++## Disable sorting of flags
++`pflag` allows you to disable sorting of flags for help and usage message.
++
++**Example**:
++```go
++flags.BoolP("verbose", "v", false, "verbose output")
++flags.String("coolflag", "yeaah", "it's really cool flag")
++flags.Int("usefulflag", 777, "sometimes it's very useful")
++flags.SortFlags = false
++flags.PrintDefaults()
++```
++**Output**:
++```
++  -v, --verbose           verbose output
++      --coolflag string   it's really cool flag (default "yeaah")
++      --usefulflag int    sometimes it's very useful (default 777)
++```
++
++
++## Supporting Go flags when using pflag
++In order to support flags defined using Go's `flag` package, they must be added to the `pflag` flagset. This is usually necessary
++to support flags defined by third-party dependencies (e.g. `golang/glog`).
++
++**Example**: You want to add the Go flags to the `CommandLine` flagset
++```go
++import (
++	goflag "flag"
++	flag "github.com/spf13/pflag"
++)
++
++var ip *int = flag.Int("flagname", 1234, "help message for flagname")
++
++func main() {
++	flag.CommandLine.AddGoFlagSet(goflag.CommandLine)
++	flag.Parse()
++}
++```
++
++## More info
++
++You can see the full reference documentation of the pflag package
++[at godoc.org][3], or through go's standard documentation system by
++running `godoc -http=:6060` and browsing to
++[http://localhost:6060/pkg/github.com/spf13/pflag][2] after
++installation.
++
++[2]: http://localhost:6060/pkg/github.com/spf13/pflag
++[3]: http://godoc.org/github.com/spf13/pflag
+diff --git a/thirdparty/pflag/bool.go b/thirdparty/pflag/bool.go
+new file mode 100644
+index 00000000..c4c5c0bf
+--- /dev/null
++++ b/thirdparty/pflag/bool.go
+@@ -0,0 +1,94 @@
++package pflag
++
++import "strconv"
++
++// optional interface to indicate boolean flags that can be
++// supplied without "=value" text
++type boolFlag interface {
++	Value
++	IsBoolFlag() bool
++}
++
++// -- bool Value
++type boolValue bool
++
++func newBoolValue(val bool, p *bool) *boolValue {
++	*p = val
++	return (*boolValue)(p)
++}
++
++func (b *boolValue) Set(s string) error {
++	v, err := strconv.ParseBool(s)
++	*b = boolValue(v)
++	return err
++}
++
++func (b *boolValue) Type() string {
++	return "bool"
++}
++
++func (b *boolValue) String() string { return strconv.FormatBool(bool(*b)) }
++
++func (b *boolValue) IsBoolFlag() bool { return true }
++
++func boolConv(sval string) (interface{}, error) {
++	return strconv.ParseBool(sval)
++}
++
++// GetBool return the bool value of a flag with the given name
++func (f *FlagSet) GetBool(name string) (bool, error) {
++	val, err := f.getFlagType(name, "bool", boolConv)
++	if err != nil {
++		return false, err
++	}
++	return val.(bool), nil
++}
++
++// BoolVar defines a bool flag with specified name, default value, and usage string.
++// The argument p points to a bool variable in which to store the value of the flag.
++func (f *FlagSet) BoolVar(p *bool, name string, value bool, usage string) {
++	f.BoolVarP(p, name, "", value, usage)
++}
++
++// BoolVarP is like BoolVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BoolVarP(p *bool, name, shorthand string, value bool, usage string) {
++	flag := f.VarPF(newBoolValue(value, p), name, shorthand, usage)
++	flag.NoOptDefVal = "true"
++}
++
++// BoolVar defines a bool flag with specified name, default value, and usage string.
++// The argument p points to a bool variable in which to store the value of the flag.
++func BoolVar(p *bool, name string, value bool, usage string) {
++	BoolVarP(p, name, "", value, usage)
++}
++
++// BoolVarP is like BoolVar, but accepts a shorthand letter that can be used after a single dash.
++func BoolVarP(p *bool, name, shorthand string, value bool, usage string) {
++	flag := CommandLine.VarPF(newBoolValue(value, p), name, shorthand, usage)
++	flag.NoOptDefVal = "true"
++}
++
++// Bool defines a bool flag with specified name, default value, and usage string.
++// The return value is the address of a bool variable that stores the value of the flag.
++func (f *FlagSet) Bool(name string, value bool, usage string) *bool {
++	return f.BoolP(name, "", value, usage)
++}
++
++// BoolP is like Bool, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BoolP(name, shorthand string, value bool, usage string) *bool {
++	p := new(bool)
++	f.BoolVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Bool defines a bool flag with specified name, default value, and usage string.
++// The return value is the address of a bool variable that stores the value of the flag.
++func Bool(name string, value bool, usage string) *bool {
++	return BoolP(name, "", value, usage)
++}
++
++// BoolP is like Bool, but accepts a shorthand letter that can be used after a single dash.
++func BoolP(name, shorthand string, value bool, usage string) *bool {
++	b := CommandLine.BoolP(name, shorthand, value, usage)
++	return b
++}
+diff --git a/thirdparty/pflag/bool_slice.go b/thirdparty/pflag/bool_slice.go
+new file mode 100644
+index 00000000..5af02f1a
+--- /dev/null
++++ b/thirdparty/pflag/bool_slice.go
+@@ -0,0 +1,147 @@
++package pflag
++
++import (
++	"io"
++	"strconv"
++	"strings"
++)
++
++// -- boolSlice Value
++type boolSliceValue struct {
++	value   *[]bool
++	changed bool
++}
++
++func newBoolSliceValue(val []bool, p *[]bool) *boolSliceValue {
++	bsv := new(boolSliceValue)
++	bsv.value = p
++	*bsv.value = val
++	return bsv
++}
++
++// Set converts, and assigns, the comma-separated boolean argument string representation as the []bool value of this flag.
++// If Set is called on a flag that already has a []bool assigned, the newly converted values will be appended.
++func (s *boolSliceValue) Set(val string) error {
++
++	// remove all quote characters
++	rmQuote := strings.NewReplacer(`"`, "", `'`, "", "`", "")
++
++	// read flag arguments with CSV parser
++	boolStrSlice, err := readAsCSV(rmQuote.Replace(val))
++	if err != nil && err != io.EOF {
++		return err
++	}
++
++	// parse boolean values into slice
++	out := make([]bool, 0, len(boolStrSlice))
++	for _, boolStr := range boolStrSlice {
++		b, err := strconv.ParseBool(strings.TrimSpace(boolStr))
++		if err != nil {
++			return err
++		}
++		out = append(out, b)
++	}
++
++	if !s.changed {
++		*s.value = out
++	} else {
++		*s.value = append(*s.value, out...)
++	}
++
++	s.changed = true
++
++	return nil
++}
++
++// Type returns a string that uniquely represents this flag's type.
++func (s *boolSliceValue) Type() string {
++	return "boolSlice"
++}
++
++// String defines a "native" format for this boolean slice flag value.
++func (s *boolSliceValue) String() string {
++
++	boolStrSlice := make([]string, len(*s.value))
++	for i, b := range *s.value {
++		boolStrSlice[i] = strconv.FormatBool(b)
++	}
++
++	out, _ := writeAsCSV(boolStrSlice)
++
++	return "[" + out + "]"
++}
++
++func boolSliceConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// Empty string would cause a slice with one (empty) entry
++	if len(val) == 0 {
++		return []bool{}, nil
++	}
++	ss := strings.Split(val, ",")
++	out := make([]bool, len(ss))
++	for i, t := range ss {
++		var err error
++		out[i], err = strconv.ParseBool(t)
++		if err != nil {
++			return nil, err
++		}
++	}
++	return out, nil
++}
++
++// GetBoolSlice returns the []bool value of a flag with the given name.
++func (f *FlagSet) GetBoolSlice(name string) ([]bool, error) {
++	val, err := f.getFlagType(name, "boolSlice", boolSliceConv)
++	if err != nil {
++		return []bool{}, err
++	}
++	return val.([]bool), nil
++}
++
++// BoolSliceVar defines a boolSlice flag with specified name, default value, and usage string.
++// The argument p points to a []bool variable in which to store the value of the flag.
++func (f *FlagSet) BoolSliceVar(p *[]bool, name string, value []bool, usage string) {
++	f.VarP(newBoolSliceValue(value, p), name, "", usage)
++}
++
++// BoolSliceVarP is like BoolSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BoolSliceVarP(p *[]bool, name, shorthand string, value []bool, usage string) {
++	f.VarP(newBoolSliceValue(value, p), name, shorthand, usage)
++}
++
++// BoolSliceVar defines a []bool flag with specified name, default value, and usage string.
++// The argument p points to a []bool variable in which to store the value of the flag.
++func BoolSliceVar(p *[]bool, name string, value []bool, usage string) {
++	CommandLine.VarP(newBoolSliceValue(value, p), name, "", usage)
++}
++
++// BoolSliceVarP is like BoolSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func BoolSliceVarP(p *[]bool, name, shorthand string, value []bool, usage string) {
++	CommandLine.VarP(newBoolSliceValue(value, p), name, shorthand, usage)
++}
++
++// BoolSlice defines a []bool flag with specified name, default value, and usage string.
++// The return value is the address of a []bool variable that stores the value of the flag.
++func (f *FlagSet) BoolSlice(name string, value []bool, usage string) *[]bool {
++	p := []bool{}
++	f.BoolSliceVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// BoolSliceP is like BoolSlice, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BoolSliceP(name, shorthand string, value []bool, usage string) *[]bool {
++	p := []bool{}
++	f.BoolSliceVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// BoolSlice defines a []bool flag with specified name, default value, and usage string.
++// The return value is the address of a []bool variable that stores the value of the flag.
++func BoolSlice(name string, value []bool, usage string) *[]bool {
++	return CommandLine.BoolSliceP(name, "", value, usage)
++}
++
++// BoolSliceP is like BoolSlice, but accepts a shorthand letter that can be used after a single dash.
++func BoolSliceP(name, shorthand string, value []bool, usage string) *[]bool {
++	return CommandLine.BoolSliceP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/bytes.go b/thirdparty/pflag/bytes.go
+new file mode 100644
+index 00000000..67d53045
+--- /dev/null
++++ b/thirdparty/pflag/bytes.go
+@@ -0,0 +1,209 @@
++package pflag
++
++import (
++	"encoding/base64"
++	"encoding/hex"
++	"fmt"
++	"strings"
++)
++
++// BytesHex adapts []byte for use as a flag. Value of flag is HEX encoded
++type bytesHexValue []byte
++
++// String implements pflag.Value.String.
++func (bytesHex bytesHexValue) String() string {
++	return fmt.Sprintf("%X", []byte(bytesHex))
++}
++
++// Set implements pflag.Value.Set.
++func (bytesHex *bytesHexValue) Set(value string) error {
++	bin, err := hex.DecodeString(strings.TrimSpace(value))
++
++	if err != nil {
++		return err
++	}
++
++	*bytesHex = bin
++
++	return nil
++}
++
++// Type implements pflag.Value.Type.
++func (*bytesHexValue) Type() string {
++	return "bytesHex"
++}
++
++func newBytesHexValue(val []byte, p *[]byte) *bytesHexValue {
++	*p = val
++	return (*bytesHexValue)(p)
++}
++
++func bytesHexConv(sval string) (interface{}, error) {
++
++	bin, err := hex.DecodeString(sval)
++
++	if err == nil {
++		return bin, nil
++	}
++
++	return nil, fmt.Errorf("invalid string being converted to Bytes: %s %s", sval, err)
++}
++
++// GetBytesHex return the []byte value of a flag with the given name
++func (f *FlagSet) GetBytesHex(name string) ([]byte, error) {
++	val, err := f.getFlagType(name, "bytesHex", bytesHexConv)
++
++	if err != nil {
++		return []byte{}, err
++	}
++
++	return val.([]byte), nil
++}
++
++// BytesHexVar defines an []byte flag with specified name, default value, and usage string.
++// The argument p points to an []byte variable in which to store the value of the flag.
++func (f *FlagSet) BytesHexVar(p *[]byte, name string, value []byte, usage string) {
++	f.VarP(newBytesHexValue(value, p), name, "", usage)
++}
++
++// BytesHexVarP is like BytesHexVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BytesHexVarP(p *[]byte, name, shorthand string, value []byte, usage string) {
++	f.VarP(newBytesHexValue(value, p), name, shorthand, usage)
++}
++
++// BytesHexVar defines an []byte flag with specified name, default value, and usage string.
++// The argument p points to an []byte variable in which to store the value of the flag.
++func BytesHexVar(p *[]byte, name string, value []byte, usage string) {
++	CommandLine.VarP(newBytesHexValue(value, p), name, "", usage)
++}
++
++// BytesHexVarP is like BytesHexVar, but accepts a shorthand letter that can be used after a single dash.
++func BytesHexVarP(p *[]byte, name, shorthand string, value []byte, usage string) {
++	CommandLine.VarP(newBytesHexValue(value, p), name, shorthand, usage)
++}
++
++// BytesHex defines an []byte flag with specified name, default value, and usage string.
++// The return value is the address of an []byte variable that stores the value of the flag.
++func (f *FlagSet) BytesHex(name string, value []byte, usage string) *[]byte {
++	p := new([]byte)
++	f.BytesHexVarP(p, name, "", value, usage)
++	return p
++}
++
++// BytesHexP is like BytesHex, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BytesHexP(name, shorthand string, value []byte, usage string) *[]byte {
++	p := new([]byte)
++	f.BytesHexVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// BytesHex defines an []byte flag with specified name, default value, and usage string.
++// The return value is the address of an []byte variable that stores the value of the flag.
++func BytesHex(name string, value []byte, usage string) *[]byte {
++	return CommandLine.BytesHexP(name, "", value, usage)
++}
++
++// BytesHexP is like BytesHex, but accepts a shorthand letter that can be used after a single dash.
++func BytesHexP(name, shorthand string, value []byte, usage string) *[]byte {
++	return CommandLine.BytesHexP(name, shorthand, value, usage)
++}
++
++// BytesBase64 adapts []byte for use as a flag. Value of flag is Base64 encoded
++type bytesBase64Value []byte
++
++// String implements pflag.Value.String.
++func (bytesBase64 bytesBase64Value) String() string {
++	return base64.StdEncoding.EncodeToString([]byte(bytesBase64))
++}
++
++// Set implements pflag.Value.Set.
++func (bytesBase64 *bytesBase64Value) Set(value string) error {
++	bin, err := base64.StdEncoding.DecodeString(strings.TrimSpace(value))
++
++	if err != nil {
++		return err
++	}
++
++	*bytesBase64 = bin
++
++	return nil
++}
++
++// Type implements pflag.Value.Type.
++func (*bytesBase64Value) Type() string {
++	return "bytesBase64"
++}
++
++func newBytesBase64Value(val []byte, p *[]byte) *bytesBase64Value {
++	*p = val
++	return (*bytesBase64Value)(p)
++}
++
++func bytesBase64ValueConv(sval string) (interface{}, error) {
++
++	bin, err := base64.StdEncoding.DecodeString(sval)
++	if err == nil {
++		return bin, nil
++	}
++
++	return nil, fmt.Errorf("invalid string being converted to Bytes: %s %s", sval, err)
++}
++
++// GetBytesBase64 return the []byte value of a flag with the given name
++func (f *FlagSet) GetBytesBase64(name string) ([]byte, error) {
++	val, err := f.getFlagType(name, "bytesBase64", bytesBase64ValueConv)
++
++	if err != nil {
++		return []byte{}, err
++	}
++
++	return val.([]byte), nil
++}
++
++// BytesBase64Var defines an []byte flag with specified name, default value, and usage string.
++// The argument p points to an []byte variable in which to store the value of the flag.
++func (f *FlagSet) BytesBase64Var(p *[]byte, name string, value []byte, usage string) {
++	f.VarP(newBytesBase64Value(value, p), name, "", usage)
++}
++
++// BytesBase64VarP is like BytesBase64Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BytesBase64VarP(p *[]byte, name, shorthand string, value []byte, usage string) {
++	f.VarP(newBytesBase64Value(value, p), name, shorthand, usage)
++}
++
++// BytesBase64Var defines an []byte flag with specified name, default value, and usage string.
++// The argument p points to an []byte variable in which to store the value of the flag.
++func BytesBase64Var(p *[]byte, name string, value []byte, usage string) {
++	CommandLine.VarP(newBytesBase64Value(value, p), name, "", usage)
++}
++
++// BytesBase64VarP is like BytesBase64Var, but accepts a shorthand letter that can be used after a single dash.
++func BytesBase64VarP(p *[]byte, name, shorthand string, value []byte, usage string) {
++	CommandLine.VarP(newBytesBase64Value(value, p), name, shorthand, usage)
++}
++
++// BytesBase64 defines an []byte flag with specified name, default value, and usage string.
++// The return value is the address of an []byte variable that stores the value of the flag.
++func (f *FlagSet) BytesBase64(name string, value []byte, usage string) *[]byte {
++	p := new([]byte)
++	f.BytesBase64VarP(p, name, "", value, usage)
++	return p
++}
++
++// BytesBase64P is like BytesBase64, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) BytesBase64P(name, shorthand string, value []byte, usage string) *[]byte {
++	p := new([]byte)
++	f.BytesBase64VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// BytesBase64 defines an []byte flag with specified name, default value, and usage string.
++// The return value is the address of an []byte variable that stores the value of the flag.
++func BytesBase64(name string, value []byte, usage string) *[]byte {
++	return CommandLine.BytesBase64P(name, "", value, usage)
++}
++
++// BytesBase64P is like BytesBase64, but accepts a shorthand letter that can be used after a single dash.
++func BytesBase64P(name, shorthand string, value []byte, usage string) *[]byte {
++	return CommandLine.BytesBase64P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/count.go b/thirdparty/pflag/count.go
+new file mode 100644
+index 00000000..aa126e44
+--- /dev/null
++++ b/thirdparty/pflag/count.go
+@@ -0,0 +1,96 @@
++package pflag
++
++import "strconv"
++
++// -- count Value
++type countValue int
++
++func newCountValue(val int, p *int) *countValue {
++	*p = val
++	return (*countValue)(p)
++}
++
++func (i *countValue) Set(s string) error {
++	// "+1" means that no specific value was passed, so increment
++	if s == "+1" {
++		*i = countValue(*i + 1)
++		return nil
++	}
++	v, err := strconv.ParseInt(s, 0, 0)
++	*i = countValue(v)
++	return err
++}
++
++func (i *countValue) Type() string {
++	return "count"
++}
++
++func (i *countValue) String() string { return strconv.Itoa(int(*i)) }
++
++func countConv(sval string) (interface{}, error) {
++	i, err := strconv.Atoi(sval)
++	if err != nil {
++		return nil, err
++	}
++	return i, nil
++}
++
++// GetCount return the int value of a flag with the given name
++func (f *FlagSet) GetCount(name string) (int, error) {
++	val, err := f.getFlagType(name, "count", countConv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(int), nil
++}
++
++// CountVar defines a count flag with specified name, default value, and usage string.
++// The argument p points to an int variable in which to store the value of the flag.
++// A count flag will add 1 to its value evey time it is found on the command line
++func (f *FlagSet) CountVar(p *int, name string, usage string) {
++	f.CountVarP(p, name, "", usage)
++}
++
++// CountVarP is like CountVar only take a shorthand for the flag name.
++func (f *FlagSet) CountVarP(p *int, name, shorthand string, usage string) {
++	flag := f.VarPF(newCountValue(0, p), name, shorthand, usage)
++	flag.NoOptDefVal = "+1"
++}
++
++// CountVar like CountVar only the flag is placed on the CommandLine instead of a given flag set
++func CountVar(p *int, name string, usage string) {
++	CommandLine.CountVar(p, name, usage)
++}
++
++// CountVarP is like CountVar only take a shorthand for the flag name.
++func CountVarP(p *int, name, shorthand string, usage string) {
++	CommandLine.CountVarP(p, name, shorthand, usage)
++}
++
++// Count defines a count flag with specified name, default value, and usage string.
++// The return value is the address of an int variable that stores the value of the flag.
++// A count flag will add 1 to its value evey time it is found on the command line
++func (f *FlagSet) Count(name string, usage string) *int {
++	p := new(int)
++	f.CountVarP(p, name, "", usage)
++	return p
++}
++
++// CountP is like Count only takes a shorthand for the flag name.
++func (f *FlagSet) CountP(name, shorthand string, usage string) *int {
++	p := new(int)
++	f.CountVarP(p, name, shorthand, usage)
++	return p
++}
++
++// Count defines a count flag with specified name, default value, and usage string.
++// The return value is the address of an int variable that stores the value of the flag.
++// A count flag will add 1 to its value evey time it is found on the command line
++func Count(name string, usage string) *int {
++	return CommandLine.CountP(name, "", usage)
++}
++
++// CountP is like Count only takes a shorthand for the flag name.
++func CountP(name, shorthand string, usage string) *int {
++	return CommandLine.CountP(name, shorthand, usage)
++}
+diff --git a/thirdparty/pflag/duration.go b/thirdparty/pflag/duration.go
+new file mode 100644
+index 00000000..e9debef8
+--- /dev/null
++++ b/thirdparty/pflag/duration.go
+@@ -0,0 +1,86 @@
++package pflag
++
++import (
++	"time"
++)
++
++// -- time.Duration Value
++type durationValue time.Duration
++
++func newDurationValue(val time.Duration, p *time.Duration) *durationValue {
++	*p = val
++	return (*durationValue)(p)
++}
++
++func (d *durationValue) Set(s string) error {
++	v, err := time.ParseDuration(s)
++	*d = durationValue(v)
++	return err
++}
++
++func (d *durationValue) Type() string {
++	return "duration"
++}
++
++func (d *durationValue) String() string { return (*time.Duration)(d).String() }
++
++func durationConv(sval string) (interface{}, error) {
++	return time.ParseDuration(sval)
++}
++
++// GetDuration return the duration value of a flag with the given name
++func (f *FlagSet) GetDuration(name string) (time.Duration, error) {
++	val, err := f.getFlagType(name, "duration", durationConv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(time.Duration), nil
++}
++
++// DurationVar defines a time.Duration flag with specified name, default value, and usage string.
++// The argument p points to a time.Duration variable in which to store the value of the flag.
++func (f *FlagSet) DurationVar(p *time.Duration, name string, value time.Duration, usage string) {
++	f.VarP(newDurationValue(value, p), name, "", usage)
++}
++
++// DurationVarP is like DurationVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) DurationVarP(p *time.Duration, name, shorthand string, value time.Duration, usage string) {
++	f.VarP(newDurationValue(value, p), name, shorthand, usage)
++}
++
++// DurationVar defines a time.Duration flag with specified name, default value, and usage string.
++// The argument p points to a time.Duration variable in which to store the value of the flag.
++func DurationVar(p *time.Duration, name string, value time.Duration, usage string) {
++	CommandLine.VarP(newDurationValue(value, p), name, "", usage)
++}
++
++// DurationVarP is like DurationVar, but accepts a shorthand letter that can be used after a single dash.
++func DurationVarP(p *time.Duration, name, shorthand string, value time.Duration, usage string) {
++	CommandLine.VarP(newDurationValue(value, p), name, shorthand, usage)
++}
++
++// Duration defines a time.Duration flag with specified name, default value, and usage string.
++// The return value is the address of a time.Duration variable that stores the value of the flag.
++func (f *FlagSet) Duration(name string, value time.Duration, usage string) *time.Duration {
++	p := new(time.Duration)
++	f.DurationVarP(p, name, "", value, usage)
++	return p
++}
++
++// DurationP is like Duration, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) DurationP(name, shorthand string, value time.Duration, usage string) *time.Duration {
++	p := new(time.Duration)
++	f.DurationVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Duration defines a time.Duration flag with specified name, default value, and usage string.
++// The return value is the address of a time.Duration variable that stores the value of the flag.
++func Duration(name string, value time.Duration, usage string) *time.Duration {
++	return CommandLine.DurationP(name, "", value, usage)
++}
++
++// DurationP is like Duration, but accepts a shorthand letter that can be used after a single dash.
++func DurationP(name, shorthand string, value time.Duration, usage string) *time.Duration {
++	return CommandLine.DurationP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/duration_slice.go b/thirdparty/pflag/duration_slice.go
+new file mode 100644
+index 00000000..52c6b6dc
+--- /dev/null
++++ b/thirdparty/pflag/duration_slice.go
+@@ -0,0 +1,128 @@
++package pflag
++
++import (
++	"fmt"
++	"strings"
++	"time"
++)
++
++// -- durationSlice Value
++type durationSliceValue struct {
++	value   *[]time.Duration
++	changed bool
++}
++
++func newDurationSliceValue(val []time.Duration, p *[]time.Duration) *durationSliceValue {
++	dsv := new(durationSliceValue)
++	dsv.value = p
++	*dsv.value = val
++	return dsv
++}
++
++func (s *durationSliceValue) Set(val string) error {
++	ss := strings.Split(val, ",")
++	out := make([]time.Duration, len(ss))
++	for i, d := range ss {
++		var err error
++		out[i], err = time.ParseDuration(d)
++		if err != nil {
++			return err
++		}
++
++	}
++	if !s.changed {
++		*s.value = out
++	} else {
++		*s.value = append(*s.value, out...)
++	}
++	s.changed = true
++	return nil
++}
++
++func (s *durationSliceValue) Type() string {
++	return "durationSlice"
++}
++
++func (s *durationSliceValue) String() string {
++	out := make([]string, len(*s.value))
++	for i, d := range *s.value {
++		out[i] = fmt.Sprintf("%s", d)
++	}
++	return "[" + strings.Join(out, ",") + "]"
++}
++
++func durationSliceConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// Empty string would cause a slice with one (empty) entry
++	if len(val) == 0 {
++		return []time.Duration{}, nil
++	}
++	ss := strings.Split(val, ",")
++	out := make([]time.Duration, len(ss))
++	for i, d := range ss {
++		var err error
++		out[i], err = time.ParseDuration(d)
++		if err != nil {
++			return nil, err
++		}
++
++	}
++	return out, nil
++}
++
++// GetDurationSlice returns the []time.Duration value of a flag with the given name
++func (f *FlagSet) GetDurationSlice(name string) ([]time.Duration, error) {
++	val, err := f.getFlagType(name, "durationSlice", durationSliceConv)
++	if err != nil {
++		return []time.Duration{}, err
++	}
++	return val.([]time.Duration), nil
++}
++
++// DurationSliceVar defines a durationSlice flag with specified name, default value, and usage string.
++// The argument p points to a []time.Duration variable in which to store the value of the flag.
++func (f *FlagSet) DurationSliceVar(p *[]time.Duration, name string, value []time.Duration, usage string) {
++	f.VarP(newDurationSliceValue(value, p), name, "", usage)
++}
++
++// DurationSliceVarP is like DurationSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) DurationSliceVarP(p *[]time.Duration, name, shorthand string, value []time.Duration, usage string) {
++	f.VarP(newDurationSliceValue(value, p), name, shorthand, usage)
++}
++
++// DurationSliceVar defines a duration[] flag with specified name, default value, and usage string.
++// The argument p points to a duration[] variable in which to store the value of the flag.
++func DurationSliceVar(p *[]time.Duration, name string, value []time.Duration, usage string) {
++	CommandLine.VarP(newDurationSliceValue(value, p), name, "", usage)
++}
++
++// DurationSliceVarP is like DurationSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func DurationSliceVarP(p *[]time.Duration, name, shorthand string, value []time.Duration, usage string) {
++	CommandLine.VarP(newDurationSliceValue(value, p), name, shorthand, usage)
++}
++
++// DurationSlice defines a []time.Duration flag with specified name, default value, and usage string.
++// The return value is the address of a []time.Duration variable that stores the value of the flag.
++func (f *FlagSet) DurationSlice(name string, value []time.Duration, usage string) *[]time.Duration {
++	p := []time.Duration{}
++	f.DurationSliceVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// DurationSliceP is like DurationSlice, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) DurationSliceP(name, shorthand string, value []time.Duration, usage string) *[]time.Duration {
++	p := []time.Duration{}
++	f.DurationSliceVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// DurationSlice defines a []time.Duration flag with specified name, default value, and usage string.
++// The return value is the address of a []time.Duration variable that stores the value of the flag.
++func DurationSlice(name string, value []time.Duration, usage string) *[]time.Duration {
++	return CommandLine.DurationSliceP(name, "", value, usage)
++}
++
++// DurationSliceP is like DurationSlice, but accepts a shorthand letter that can be used after a single dash.
++func DurationSliceP(name, shorthand string, value []time.Duration, usage string) *[]time.Duration {
++	return CommandLine.DurationSliceP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/flag.go b/thirdparty/pflag/flag.go
+new file mode 100644
+index 00000000..5cc710cc
+--- /dev/null
++++ b/thirdparty/pflag/flag.go
+@@ -0,0 +1,1224 @@
++// Copyright 2009 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++/*
++Package pflag is a drop-in replacement for Go's flag package, implementing
++POSIX/GNU-style --flags.
++
++pflag is compatible with the GNU extensions to the POSIX recommendations
++for command-line options. See
++http://www.gnu.org/software/libc/manual/html_node/Argument-Syntax.html
++
++Usage:
++
++pflag is a drop-in replacement of Go's native flag package. If you import
++pflag under the name "flag" then all code should continue to function
++with no changes.
++
++	import flag "github.com/spf13/pflag"
++
++There is one exception to this: if you directly instantiate the Flag struct
++there is one more field "Shorthand" that you will need to set.
++Most code never instantiates this struct directly, and instead uses
++functions such as String(), BoolVar(), and Var(), and is therefore
++unaffected.
++
++Define flags using flag.String(), Bool(), Int(), etc.
++
++This declares an integer flag, -flagname, stored in the pointer ip, with type *int.
++	var ip = flag.Int("flagname", 1234, "help message for flagname")
++If you like, you can bind the flag to a variable using the Var() functions.
++	var flagvar int
++	func init() {
++		flag.IntVar(&flagvar, "flagname", 1234, "help message for flagname")
++	}
++Or you can create custom flags that satisfy the Value interface (with
++pointer receivers) and couple them to flag parsing by
++	flag.Var(&flagVal, "name", "help message for flagname")
++For such flags, the default value is just the initial value of the variable.
++
++After all flags are defined, call
++	flag.Parse()
++to parse the command line into the defined flags.
++
++Flags may then be used directly. If you're using the flags themselves,
++they are all pointers; if you bind to variables, they're values.
++	fmt.Println("ip has value ", *ip)
++	fmt.Println("flagvar has value ", flagvar)
++
++After parsing, the arguments after the flag are available as the
++slice flag.Args() or individually as flag.Arg(i).
++The arguments are indexed from 0 through flag.NArg()-1.
++
++The pflag package also defines some new functions that are not in flag,
++that give one-letter shorthands for flags. You can use these by appending
++'P' to the name of any function that defines a flag.
++	var ip = flag.IntP("flagname", "f", 1234, "help message")
++	var flagvar bool
++	func init() {
++		flag.BoolVarP("boolname", "b", true, "help message")
++	}
++	flag.VarP(&flagVar, "varname", "v", 1234, "help message")
++Shorthand letters can be used with single dashes on the command line.
++Boolean shorthand flags can be combined with other shorthand flags.
++
++Command line flag syntax:
++	--flag    // boolean flags only
++	--flag=x
++
++Unlike the flag package, a single dash before an option means something
++different than a double dash. Single dashes signify a series of shorthand
++letters for flags. All but the last shorthand letter must be boolean flags.
++	// boolean flags
++	-f
++	-abc
++	// non-boolean flags
++	-n 1234
++	-Ifile
++	// mixed
++	-abcs "hello"
++	-abcn1234
++
++Flag parsing stops after the terminator "--". Unlike the flag package,
++flags can be interspersed with arguments anywhere on the command line
++before this terminator.
++
++Integer flags accept 1234, 0664, 0x1234 and may be negative.
++Boolean flags (in their long form) accept 1, 0, t, f, true, false,
++TRUE, FALSE, True, False.
++Duration flags accept any input valid for time.ParseDuration.
++
++The default set of command-line flags is controlled by
++top-level functions.  The FlagSet type allows one to define
++independent sets of flags, such as to implement subcommands
++in a command-line interface. The methods of FlagSet are
++analogous to the top-level functions for the command-line
++flag set.
++*/
++package pflag
++
++import (
++	"bytes"
++	"errors"
++	goflag "flag"
++	"fmt"
++	"io"
++	"os"
++	"sort"
++	"strings"
++)
++
++// ErrHelp is the error returned if the flag -help is invoked but no such flag is defined.
++var ErrHelp = errors.New("pflag: help requested")
++
++// ErrorHandling defines how to handle flag parsing errors.
++type ErrorHandling int
++
++const (
++	// ContinueOnError will return an err from Parse() if an error is found
++	ContinueOnError ErrorHandling = iota
++	// ExitOnError will call os.Exit(2) if an error is found when parsing
++	ExitOnError
++	// PanicOnError will panic() if an error is found when parsing flags
++	PanicOnError
++)
++
++// ParseErrorsWhitelist defines the parsing errors that can be ignored
++type ParseErrorsWhitelist struct {
++	// UnknownFlags will ignore unknown flags errors and continue parsing rest of the flags
++	UnknownFlags bool
++}
++
++// NormalizedName is a flag name that has been normalized according to rules
++// for the FlagSet (e.g. making '-' and '_' equivalent).
++type NormalizedName string
++
++// A FlagSet represents a set of defined flags.
++type FlagSet struct {
++	// Usage is the function called when an error occurs while parsing flags.
++	// The field is a function (not a method) that may be changed to point to
++	// a custom error handler.
++	Usage func()
++
++	// SortFlags is used to indicate, if user wants to have sorted flags in
++	// help/usage messages.
++	SortFlags bool
++
++	// ParseErrorsWhitelist is used to configure a whitelist of errors
++	ParseErrorsWhitelist ParseErrorsWhitelist
++
++	name              string
++	parsed            bool
++	actual            map[NormalizedName]*Flag
++	orderedActual     []*Flag
++	sortedActual      []*Flag
++	formal            map[NormalizedName]*Flag
++	orderedFormal     []*Flag
++	sortedFormal      []*Flag
++	shorthands        map[byte]*Flag
++	args              []string // arguments after flags
++	argsLenAtDash     int      // len(args) when a '--' was located when parsing, or -1 if no --
++	errorHandling     ErrorHandling
++	output            io.Writer // nil means stderr; use out() accessor
++	interspersed      bool      // allow interspersed option/non-option args
++	normalizeNameFunc func(f *FlagSet, name string) NormalizedName
++
++	addedGoFlagSets []*goflag.FlagSet
++}
++
++// A Flag represents the state of a flag.
++type Flag struct {
++	Name                string              // name as it appears on command line
++	Shorthand           string              // one-letter abbreviated flag
++	Usage               string              // help message
++	Value               Value               // value as set
++	DefValue            string              // default value (as text); for usage message
++	Changed             bool                // If the user set the value (or if left to default)
++	NoOptDefVal         string              // default value (as text); if the flag is on the command line without any options
++	Deprecated          string              // If this flag is deprecated, this string is the new or now thing to use
++	Hidden              bool                // used by cobra.Command to allow flags to be hidden from help/usage text
++	ShorthandDeprecated string              // If the shorthand of this flag is deprecated, this string is the new or now thing to use
++	Annotations         map[string][]string // used by cobra.Command bash autocomple code
++}
++
++// Value is the interface to the dynamic value stored in a flag.
++// (The default value is represented as a string.)
++type Value interface {
++	String() string
++	Set(string) error
++	Type() string
++}
++
++// sortFlags returns the flags as a slice in lexicographical sorted order.
++func sortFlags(flags map[NormalizedName]*Flag) []*Flag {
++	list := make(sort.StringSlice, len(flags))
++	i := 0
++	for k := range flags {
++		list[i] = string(k)
++		i++
++	}
++	list.Sort()
++	result := make([]*Flag, len(list))
++	for i, name := range list {
++		result[i] = flags[NormalizedName(name)]
++	}
++	return result
++}
++
++// SetNormalizeFunc allows you to add a function which can translate flag names.
++// Flags added to the FlagSet will be translated and then when anything tries to
++// look up the flag that will also be translated. So it would be possible to create
++// a flag named "getURL" and have it translated to "geturl".  A user could then pass
++// "--getUrl" which may also be translated to "geturl" and everything will work.
++func (f *FlagSet) SetNormalizeFunc(n func(f *FlagSet, name string) NormalizedName) {
++	f.normalizeNameFunc = n
++	f.sortedFormal = f.sortedFormal[:0]
++	for fname, flag := range f.formal {
++		nname := f.normalizeFlagName(flag.Name)
++		if fname == nname {
++			continue
++		}
++		flag.Name = string(nname)
++		delete(f.formal, fname)
++		f.formal[nname] = flag
++		if _, set := f.actual[fname]; set {
++			delete(f.actual, fname)
++			f.actual[nname] = flag
++		}
++	}
++}
++
++// GetNormalizeFunc returns the previously set NormalizeFunc of a function which
++// does no translation, if not set previously.
++func (f *FlagSet) GetNormalizeFunc() func(f *FlagSet, name string) NormalizedName {
++	if f.normalizeNameFunc != nil {
++		return f.normalizeNameFunc
++	}
++	return func(f *FlagSet, name string) NormalizedName { return NormalizedName(name) }
++}
++
++func (f *FlagSet) normalizeFlagName(name string) NormalizedName {
++	n := f.GetNormalizeFunc()
++	return n(f, name)
++}
++
++func (f *FlagSet) out() io.Writer {
++	if f.output == nil {
++		return os.Stderr
++	}
++	return f.output
++}
++
++// SetOutput sets the destination for usage and error messages.
++// If output is nil, os.Stderr is used.
++func (f *FlagSet) SetOutput(output io.Writer) {
++	f.output = output
++}
++
++// VisitAll visits the flags in lexicographical order or
++// in primordial order if f.SortFlags is false, calling fn for each.
++// It visits all flags, even those not set.
++func (f *FlagSet) VisitAll(fn func(*Flag)) {
++	if len(f.formal) == 0 {
++		return
++	}
++
++	var flags []*Flag
++	if f.SortFlags {
++		if len(f.formal) != len(f.sortedFormal) {
++			f.sortedFormal = sortFlags(f.formal)
++		}
++		flags = f.sortedFormal
++	} else {
++		flags = f.orderedFormal
++	}
++
++	for _, flag := range flags {
++		fn(flag)
++	}
++}
++
++// HasFlags returns a bool to indicate if the FlagSet has any flags defined.
++func (f *FlagSet) HasFlags() bool {
++	return len(f.formal) > 0
++}
++
++// HasAvailableFlags returns a bool to indicate if the FlagSet has any flags
++// that are not hidden.
++func (f *FlagSet) HasAvailableFlags() bool {
++	for _, flag := range f.formal {
++		if !flag.Hidden {
++			return true
++		}
++	}
++	return false
++}
++
++// VisitAll visits the command-line flags in lexicographical order or
++// in primordial order if f.SortFlags is false, calling fn for each.
++// It visits all flags, even those not set.
++func VisitAll(fn func(*Flag)) {
++	CommandLine.VisitAll(fn)
++}
++
++// Visit visits the flags in lexicographical order or
++// in primordial order if f.SortFlags is false, calling fn for each.
++// It visits only those flags that have been set.
++func (f *FlagSet) Visit(fn func(*Flag)) {
++	if len(f.actual) == 0 {
++		return
++	}
++
++	var flags []*Flag
++	if f.SortFlags {
++		if len(f.actual) != len(f.sortedActual) {
++			f.sortedActual = sortFlags(f.actual)
++		}
++		flags = f.sortedActual
++	} else {
++		flags = f.orderedActual
++	}
++
++	for _, flag := range flags {
++		fn(flag)
++	}
++}
++
++// Visit visits the command-line flags in lexicographical order or
++// in primordial order if f.SortFlags is false, calling fn for each.
++// It visits only those flags that have been set.
++func Visit(fn func(*Flag)) {
++	CommandLine.Visit(fn)
++}
++
++// Lookup returns the Flag structure of the named flag, returning nil if none exists.
++func (f *FlagSet) Lookup(name string) *Flag {
++	return f.lookup(f.normalizeFlagName(name))
++}
++
++// ShorthandLookup returns the Flag structure of the short handed flag,
++// returning nil if none exists.
++// It panics, if len(name) > 1.
++func (f *FlagSet) ShorthandLookup(name string) *Flag {
++	if name == "" {
++		return nil
++	}
++	if len(name) > 1 {
++		msg := fmt.Sprintf("can not look up shorthand which is more than one ASCII character: %q", name)
++		fmt.Fprintf(f.out(), msg)
++		panic(msg)
++	}
++	c := name[0]
++	return f.shorthands[c]
++}
++
++// lookup returns the Flag structure of the named flag, returning nil if none exists.
++func (f *FlagSet) lookup(name NormalizedName) *Flag {
++	return f.formal[name]
++}
++
++// func to return a given type for a given flag name
++func (f *FlagSet) getFlagType(name string, ftype string, convFunc func(sval string) (interface{}, error)) (interface{}, error) {
++	flag := f.Lookup(name)
++	if flag == nil {
++		err := fmt.Errorf("flag accessed but not defined: %s", name)
++		return nil, err
++	}
++
++	if flag.Value.Type() != ftype {
++		err := fmt.Errorf("trying to get %s value of flag of type %s", ftype, flag.Value.Type())
++		return nil, err
++	}
++
++	sval := flag.Value.String()
++	result, err := convFunc(sval)
++	if err != nil {
++		return nil, err
++	}
++	return result, nil
++}
++
++// ArgsLenAtDash will return the length of f.Args at the moment when a -- was
++// found during arg parsing. This allows your program to know which args were
++// before the -- and which came after.
++func (f *FlagSet) ArgsLenAtDash() int {
++	return f.argsLenAtDash
++}
++
++// MarkDeprecated indicated that a flag is deprecated in your program. It will
++// continue to function but will not show up in help or usage messages. Using
++// this flag will also print the given usageMessage.
++func (f *FlagSet) MarkDeprecated(name string, usageMessage string) error {
++	flag := f.Lookup(name)
++	if flag == nil {
++		return fmt.Errorf("flag %q does not exist", name)
++	}
++	if usageMessage == "" {
++		return fmt.Errorf("deprecated message for flag %q must be set", name)
++	}
++	flag.Deprecated = usageMessage
++	flag.Hidden = true
++	return nil
++}
++
++// MarkShorthandDeprecated will mark the shorthand of a flag deprecated in your
++// program. It will continue to function but will not show up in help or usage
++// messages. Using this flag will also print the given usageMessage.
++func (f *FlagSet) MarkShorthandDeprecated(name string, usageMessage string) error {
++	flag := f.Lookup(name)
++	if flag == nil {
++		return fmt.Errorf("flag %q does not exist", name)
++	}
++	if usageMessage == "" {
++		return fmt.Errorf("deprecated message for flag %q must be set", name)
++	}
++	flag.ShorthandDeprecated = usageMessage
++	return nil
++}
++
++// MarkHidden sets a flag to 'hidden' in your program. It will continue to
++// function but will not show up in help or usage messages.
++func (f *FlagSet) MarkHidden(name string) error {
++	flag := f.Lookup(name)
++	if flag == nil {
++		return fmt.Errorf("flag %q does not exist", name)
++	}
++	flag.Hidden = true
++	return nil
++}
++
++// Lookup returns the Flag structure of the named command-line flag,
++// returning nil if none exists.
++func Lookup(name string) *Flag {
++	return CommandLine.Lookup(name)
++}
++
++// ShorthandLookup returns the Flag structure of the short handed flag,
++// returning nil if none exists.
++func ShorthandLookup(name string) *Flag {
++	return CommandLine.ShorthandLookup(name)
++}
++
++// Set sets the value of the named flag.
++func (f *FlagSet) Set(name, value string) error {
++	normalName := f.normalizeFlagName(name)
++	flag, ok := f.formal[normalName]
++	if !ok {
++		return fmt.Errorf("no such flag -%v", name)
++	}
++
++	err := flag.Value.Set(value)
++	if err != nil {
++		var flagName string
++		if flag.Shorthand != "" && flag.ShorthandDeprecated == "" {
++			flagName = fmt.Sprintf("-%s, --%s", flag.Shorthand, flag.Name)
++		} else {
++			flagName = fmt.Sprintf("--%s", flag.Name)
++		}
++		return fmt.Errorf("invalid argument %q for %q flag: %v", value, flagName, err)
++	}
++
++	if !flag.Changed {
++		if f.actual == nil {
++			f.actual = make(map[NormalizedName]*Flag)
++		}
++		f.actual[normalName] = flag
++		f.orderedActual = append(f.orderedActual, flag)
++
++		flag.Changed = true
++	}
++
++	if flag.Deprecated != "" {
++		fmt.Fprintf(f.out(), "Flag --%s has been deprecated, %s\n", flag.Name, flag.Deprecated)
++	}
++	return nil
++}
++
++// SetAnnotation allows one to set arbitrary annotations on a flag in the FlagSet.
++// This is sometimes used by spf13/cobra programs which want to generate additional
++// bash completion information.
++func (f *FlagSet) SetAnnotation(name, key string, values []string) error {
++	normalName := f.normalizeFlagName(name)
++	flag, ok := f.formal[normalName]
++	if !ok {
++		return fmt.Errorf("no such flag -%v", name)
++	}
++	if flag.Annotations == nil {
++		flag.Annotations = map[string][]string{}
++	}
++	flag.Annotations[key] = values
++	return nil
++}
++
++// Changed returns true if the flag was explicitly set during Parse() and false
++// otherwise
++func (f *FlagSet) Changed(name string) bool {
++	flag := f.Lookup(name)
++	// If a flag doesn't exist, it wasn't changed....
++	if flag == nil {
++		return false
++	}
++	return flag.Changed
++}
++
++// Set sets the value of the named command-line flag.
++func Set(name, value string) error {
++	return CommandLine.Set(name, value)
++}
++
++// PrintDefaults prints, to standard error unless configured
++// otherwise, the default values of all defined flags in the set.
++func (f *FlagSet) PrintDefaults() {
++	usages := f.FlagUsages()
++	fmt.Fprint(f.out(), usages)
++}
++
++// defaultIsZeroValue returns true if the default value for this flag represents
++// a zero value.
++func (f *Flag) defaultIsZeroValue() bool {
++	switch f.Value.(type) {
++	case boolFlag:
++		return f.DefValue == "false"
++	case *durationValue:
++		// Beginning in Go 1.7, duration zero values are "0s"
++		return f.DefValue == "0" || f.DefValue == "0s"
++	case *intValue, *int8Value, *int32Value, *int64Value, *uintValue, *uint8Value, *uint16Value, *uint32Value, *uint64Value, *countValue, *float32Value, *float64Value:
++		return f.DefValue == "0"
++	case *stringValue:
++		return f.DefValue == ""
++	case *ipValue, *ipMaskValue, *ipNetValue:
++		return f.DefValue == "<nil>"
++	case *intSliceValue, *stringSliceValue, *stringArrayValue:
++		return f.DefValue == "[]"
++	default:
++		switch f.Value.String() {
++		case "false":
++			return true
++		case "<nil>":
++			return true
++		case "":
++			return true
++		case "0":
++			return true
++		}
++		return false
++	}
++}
++
++// UnquoteUsage extracts a back-quoted name from the usage
++// string for a flag and returns it and the un-quoted usage.
++// Given "a `name` to show" it returns ("name", "a name to show").
++// If there are no back quotes, the name is an educated guess of the
++// type of the flag's value, or the empty string if the flag is boolean.
++func UnquoteUsage(flag *Flag) (name string, usage string) {
++	// Look for a back-quoted name, but avoid the strings package.
++	usage = flag.Usage
++	for i := 0; i < len(usage); i++ {
++		if usage[i] == '`' {
++			for j := i + 1; j < len(usage); j++ {
++				if usage[j] == '`' {
++					name = usage[i+1 : j]
++					usage = usage[:i] + name + usage[j+1:]
++					return name, usage
++				}
++			}
++			break // Only one back quote; use type name.
++		}
++	}
++
++	name = flag.Value.Type()
++	switch name {
++	case "bool":
++		name = ""
++	case "float64":
++		name = "float"
++	case "int64":
++		name = "int"
++	case "uint64":
++		name = "uint"
++	case "stringSlice":
++		name = "strings"
++	case "intSlice":
++		name = "ints"
++	case "uintSlice":
++		name = "uints"
++	case "boolSlice":
++		name = "bools"
++	}
++
++	return
++}
++
++// Splits the string `s` on whitespace into an initial substring up to
++// `i` runes in length and the remainder. Will go `slop` over `i` if
++// that encompasses the entire string (which allows the caller to
++// avoid short orphan words on the final line).
++func wrapN(i, slop int, s string) (string, string) {
++	if i+slop > len(s) {
++		return s, ""
++	}
++
++	w := strings.LastIndexAny(s[:i], " \t\n")
++	if w <= 0 {
++		return s, ""
++	}
++	nlPos := strings.LastIndex(s[:i], "\n")
++	if nlPos > 0 && nlPos < w {
++		return s[:nlPos], s[nlPos+1:]
++	}
++	return s[:w], s[w+1:]
++}
++
++// Wraps the string `s` to a maximum width `w` with leading indent
++// `i`. The first line is not indented (this is assumed to be done by
++// caller). Pass `w` == 0 to do no wrapping
++func wrap(i, w int, s string) string {
++	if w == 0 {
++		return strings.Replace(s, "\n", "\n"+strings.Repeat(" ", i), -1)
++	}
++
++	// space between indent i and end of line width w into which
++	// we should wrap the text.
++	wrap := w - i
++
++	var r, l string
++
++	// Not enough space for sensible wrapping. Wrap as a block on
++	// the next line instead.
++	if wrap < 24 {
++		i = 16
++		wrap = w - i
++		r += "\n" + strings.Repeat(" ", i)
++	}
++	// If still not enough space then don't even try to wrap.
++	if wrap < 24 {
++		return strings.Replace(s, "\n", r, -1)
++	}
++
++	// Try to avoid short orphan words on the final line, by
++	// allowing wrapN to go a bit over if that would fit in the
++	// remainder of the line.
++	slop := 5
++	wrap = wrap - slop
++
++	// Handle first line, which is indented by the caller (or the
++	// special case above)
++	l, s = wrapN(wrap, slop, s)
++	r = r + strings.Replace(l, "\n", "\n"+strings.Repeat(" ", i), -1)
++
++	// Now wrap the rest
++	for s != "" {
++		var t string
++
++		t, s = wrapN(wrap, slop, s)
++		r = r + "\n" + strings.Repeat(" ", i) + strings.Replace(t, "\n", "\n"+strings.Repeat(" ", i), -1)
++	}
++
++	return r
++
++}
++
++// FlagUsagesWrapped returns a string containing the usage information
++// for all flags in the FlagSet. Wrapped to `cols` columns (0 for no
++// wrapping)
++func (f *FlagSet) FlagUsagesWrapped(cols int) string {
++	buf := new(bytes.Buffer)
++
++	lines := make([]string, 0, len(f.formal))
++
++	maxlen := 0
++	f.VisitAll(func(flag *Flag) {
++		if flag.Hidden {
++			return
++		}
++
++		line := ""
++		if flag.Shorthand != "" && flag.ShorthandDeprecated == "" {
++			line = fmt.Sprintf("  -%s, --%s", flag.Shorthand, flag.Name)
++		} else {
++			line = fmt.Sprintf("      --%s", flag.Name)
++		}
++
++		varname, usage := UnquoteUsage(flag)
++		if varname != "" {
++			line += " " + varname
++		}
++		if flag.NoOptDefVal != "" {
++			switch flag.Value.Type() {
++			case "string":
++				line += fmt.Sprintf("[=\"%s\"]", flag.NoOptDefVal)
++			case "bool":
++				if flag.NoOptDefVal != "true" {
++					line += fmt.Sprintf("[=%s]", flag.NoOptDefVal)
++				}
++			case "count":
++				if flag.NoOptDefVal != "+1" {
++					line += fmt.Sprintf("[=%s]", flag.NoOptDefVal)
++				}
++			default:
++				line += fmt.Sprintf("[=%s]", flag.NoOptDefVal)
++			}
++		}
++
++		// This special character will be replaced with spacing once the
++		// correct alignment is calculated
++		line += "\x00"
++		if len(line) > maxlen {
++			maxlen = len(line)
++		}
++
++		line += usage
++		if !flag.defaultIsZeroValue() {
++			if flag.Value.Type() == "string" {
++				line += fmt.Sprintf(" (default %q)", flag.DefValue)
++			} else {
++				line += fmt.Sprintf(" (default %s)", flag.DefValue)
++			}
++		}
++		if len(flag.Deprecated) != 0 {
++			line += fmt.Sprintf(" (DEPRECATED: %s)", flag.Deprecated)
++		}
++
++		lines = append(lines, line)
++	})
++
++	for _, line := range lines {
++		sidx := strings.Index(line, "\x00")
++		spacing := strings.Repeat(" ", maxlen-sidx)
++		// maxlen + 2 comes from + 1 for the \x00 and + 1 for the (deliberate) off-by-one in maxlen-sidx
++		fmt.Fprintln(buf, line[:sidx], spacing, wrap(maxlen+2, cols, line[sidx+1:]))
++	}
++
++	return buf.String()
++}
++
++// FlagUsages returns a string containing the usage information for all flags in
++// the FlagSet
++func (f *FlagSet) FlagUsages() string {
++	return f.FlagUsagesWrapped(0)
++}
++
++// PrintDefaults prints to standard error the default values of all defined command-line flags.
++func PrintDefaults() {
++	CommandLine.PrintDefaults()
++}
++
++// defaultUsage is the default function to print a usage message.
++func defaultUsage(f *FlagSet) {
++	fmt.Fprintf(f.out(), "Usage of %s:\n", f.name)
++	f.PrintDefaults()
++}
++
++// NOTE: Usage is not just defaultUsage(CommandLine)
++// because it serves (via godoc flag Usage) as the example
++// for how to write your own usage function.
++
++// Usage prints to standard error a usage message documenting all defined command-line flags.
++// The function is a variable that may be changed to point to a custom function.
++// By default it prints a simple header and calls PrintDefaults; for details about the
++// format of the output and how to control it, see the documentation for PrintDefaults.
++var Usage = func() {
++	fmt.Fprintf(os.Stderr, "Usage of %s:\n", os.Args[0])
++	PrintDefaults()
++}
++
++// NFlag returns the number of flags that have been set.
++func (f *FlagSet) NFlag() int { return len(f.actual) }
++
++// NFlag returns the number of command-line flags that have been set.
++func NFlag() int { return len(CommandLine.actual) }
++
++// Arg returns the i'th argument.  Arg(0) is the first remaining argument
++// after flags have been processed.
++func (f *FlagSet) Arg(i int) string {
++	if i < 0 || i >= len(f.args) {
++		return ""
++	}
++	return f.args[i]
++}
++
++// Arg returns the i'th command-line argument.  Arg(0) is the first remaining argument
++// after flags have been processed.
++func Arg(i int) string {
++	return CommandLine.Arg(i)
++}
++
++// NArg is the number of arguments remaining after flags have been processed.
++func (f *FlagSet) NArg() int { return len(f.args) }
++
++// NArg is the number of arguments remaining after flags have been processed.
++func NArg() int { return len(CommandLine.args) }
++
++// Args returns the non-flag arguments.
++func (f *FlagSet) Args() []string { return f.args }
++
++// Args returns the non-flag command-line arguments.
++func Args() []string { return CommandLine.args }
++
++// Var defines a flag with the specified name and usage string. The type and
++// value of the flag are represented by the first argument, of type Value, which
++// typically holds a user-defined implementation of Value. For instance, the
++// caller could create a flag that turns a comma-separated string into a slice
++// of strings by giving the slice the methods of Value; in particular, Set would
++// decompose the comma-separated string into the slice.
++func (f *FlagSet) Var(value Value, name string, usage string) {
++	f.VarP(value, name, "", usage)
++}
++
++// VarPF is like VarP, but returns the flag created
++func (f *FlagSet) VarPF(value Value, name, shorthand, usage string) *Flag {
++	// Remember the default value as a string; it won't change.
++	flag := &Flag{
++		Name:      name,
++		Shorthand: shorthand,
++		Usage:     usage,
++		Value:     value,
++		DefValue:  value.String(),
++	}
++	f.AddFlag(flag)
++	return flag
++}
++
++// VarP is like Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) VarP(value Value, name, shorthand, usage string) {
++	f.VarPF(value, name, shorthand, usage)
++}
++
++// AddFlag will add the flag to the FlagSet
++func (f *FlagSet) AddFlag(flag *Flag) {
++	normalizedFlagName := f.normalizeFlagName(flag.Name)
++
++	_, alreadyThere := f.formal[normalizedFlagName]
++	if alreadyThere {
++		msg := fmt.Sprintf("%s flag redefined: %s", f.name, flag.Name)
++		fmt.Fprintln(f.out(), msg)
++		panic(msg) // Happens only if flags are declared with identical names
++	}
++	if f.formal == nil {
++		f.formal = make(map[NormalizedName]*Flag)
++	}
++
++	flag.Name = string(normalizedFlagName)
++	f.formal[normalizedFlagName] = flag
++	f.orderedFormal = append(f.orderedFormal, flag)
++
++	if flag.Shorthand == "" {
++		return
++	}
++	if len(flag.Shorthand) > 1 {
++		msg := fmt.Sprintf("%q shorthand is more than one ASCII character", flag.Shorthand)
++		fmt.Fprintf(f.out(), msg)
++		panic(msg)
++	}
++	if f.shorthands == nil {
++		f.shorthands = make(map[byte]*Flag)
++	}
++	c := flag.Shorthand[0]
++	used, alreadyThere := f.shorthands[c]
++	if alreadyThere {
++		msg := fmt.Sprintf("unable to redefine %q shorthand in %q flagset: it's already used for %q flag", c, f.name, used.Name)
++		fmt.Fprintf(f.out(), msg)
++		panic(msg)
++	}
++	f.shorthands[c] = flag
++}
++
++// AddFlagSet adds one FlagSet to another. If a flag is already present in f
++// the flag from newSet will be ignored.
++func (f *FlagSet) AddFlagSet(newSet *FlagSet) {
++	if newSet == nil {
++		return
++	}
++	newSet.VisitAll(func(flag *Flag) {
++		if f.Lookup(flag.Name) == nil {
++			f.AddFlag(flag)
++		}
++	})
++}
++
++// Var defines a flag with the specified name and usage string. The type and
++// value of the flag are represented by the first argument, of type Value, which
++// typically holds a user-defined implementation of Value. For instance, the
++// caller could create a flag that turns a comma-separated string into a slice
++// of strings by giving the slice the methods of Value; in particular, Set would
++// decompose the comma-separated string into the slice.
++func Var(value Value, name string, usage string) {
++	CommandLine.VarP(value, name, "", usage)
++}
++
++// VarP is like Var, but accepts a shorthand letter that can be used after a single dash.
++func VarP(value Value, name, shorthand, usage string) {
++	CommandLine.VarP(value, name, shorthand, usage)
++}
++
++// failf prints to standard error a formatted error and usage message and
++// returns the error.
++func (f *FlagSet) failf(format string, a ...interface{}) error {
++	err := fmt.Errorf(format, a...)
++	if f.errorHandling != ContinueOnError {
++		fmt.Fprintln(f.out(), err)
++		f.usage()
++	}
++	return err
++}
++
++// usage calls the Usage method for the flag set, or the usage function if
++// the flag set is CommandLine.
++func (f *FlagSet) usage() {
++	if f == CommandLine {
++		Usage()
++	} else if f.Usage == nil {
++		defaultUsage(f)
++	} else {
++		f.Usage()
++	}
++}
++
++//--unknown (args will be empty)
++//--unknown --next-flag ... (args will be --next-flag ...)
++//--unknown arg ... (args will be arg ...)
++func stripUnknownFlagValue(args []string) []string {
++	if len(args) == 0 {
++		//--unknown
++		return args
++	}
++
++	first := args[0]
++	if first[0] == '-' {
++		//--unknown --next-flag ...
++		return args
++	}
++
++	//--unknown arg ... (args will be arg ...)
++	return args[1:]
++}
++
++func (f *FlagSet) parseLongArg(s string, args []string, fn parseFunc) (a []string, err error) {
++	a = args
++	name := s[2:]
++	if len(name) == 0 || name[0] == '-' || name[0] == '=' {
++		err = f.failf("bad flag syntax: %s", s)
++		return
++	}
++
++	split := strings.SplitN(name, "=", 2)
++	name = split[0]
++	flag, exists := f.formal[f.normalizeFlagName(name)]
++
++	if !exists {
++		switch {
++		case name == "help":
++			f.usage()
++			return a, ErrHelp
++		case f.ParseErrorsWhitelist.UnknownFlags:
++			// --unknown=unknownval arg ...
++			// we do not want to lose arg in this case
++			if len(split) >= 2 {
++				return a, nil
++			}
++
++			return stripUnknownFlagValue(a), nil
++		default:
++			err = f.failf("unknown flag: --%s", name)
++			return
++		}
++	}
++
++	var value string
++	if len(split) == 2 {
++		// '--flag=arg'
++		value = split[1]
++	} else if flag.NoOptDefVal != "" {
++		// '--flag' (arg was optional)
++		value = flag.NoOptDefVal
++	} else if len(a) > 0 {
++		// '--flag arg'
++		value = a[0]
++		a = a[1:]
++	} else {
++		// '--flag' (arg was required)
++		err = f.failf("flag needs an argument: %s", s)
++		return
++	}
++
++	err = fn(flag, value)
++	if err != nil {
++		f.failf(err.Error())
++	}
++	return
++}
++
++func (f *FlagSet) parseSingleShortArg(shorthands string, args []string, fn parseFunc) (outShorts string, outArgs []string, err error) {
++	outArgs = args
++
++	if strings.HasPrefix(shorthands, "test.") {
++		return
++	}
++
++	outShorts = shorthands[1:]
++	c := shorthands[0]
++
++	flag, exists := f.shorthands[c]
++	if !exists {
++		switch {
++		case c == 'h':
++			f.usage()
++			err = ErrHelp
++			return
++		case f.ParseErrorsWhitelist.UnknownFlags:
++			// '-f=arg arg ...'
++			// we do not want to lose arg in this case
++			if len(shorthands) > 2 && shorthands[1] == '=' {
++				outShorts = ""
++				return
++			}
++
++			outArgs = stripUnknownFlagValue(outArgs)
++			return
++		default:
++			err = f.failf("unknown shorthand flag: %q in -%s", c, shorthands)
++			return
++		}
++	}
++
++	var value string
++	if len(shorthands) > 2 && shorthands[1] == '=' {
++		// '-f=arg'
++		value = shorthands[2:]
++		outShorts = ""
++	} else if flag.NoOptDefVal != "" {
++		// '-f' (arg was optional)
++		value = flag.NoOptDefVal
++	} else if len(shorthands) > 1 {
++		// '-farg'
++		value = shorthands[1:]
++		outShorts = ""
++	} else if len(args) > 0 {
++		// '-f arg'
++		value = args[0]
++		outArgs = args[1:]
++	} else {
++		// '-f' (arg was required)
++		err = f.failf("flag needs an argument: %q in -%s", c, shorthands)
++		return
++	}
++
++	if flag.ShorthandDeprecated != "" {
++		fmt.Fprintf(f.out(), "Flag shorthand -%s has been deprecated, %s\n", flag.Shorthand, flag.ShorthandDeprecated)
++	}
++
++	err = fn(flag, value)
++	if err != nil {
++		f.failf(err.Error())
++	}
++	return
++}
++
++func (f *FlagSet) parseShortArg(s string, args []string, fn parseFunc) (a []string, err error) {
++	a = args
++	shorthands := s[1:]
++
++	// "shorthands" can be a series of shorthand letters of flags (e.g. "-vvv").
++	for len(shorthands) > 0 {
++		shorthands, a, err = f.parseSingleShortArg(shorthands, args, fn)
++		if err != nil {
++			return
++		}
++	}
++
++	return
++}
++
++func (f *FlagSet) parseArgs(args []string, fn parseFunc) (err error) {
++	for len(args) > 0 {
++		s := args[0]
++		args = args[1:]
++		if len(s) == 0 || s[0] != '-' || len(s) == 1 {
++			if !f.interspersed {
++				f.args = append(f.args, s)
++				f.args = append(f.args, args...)
++				return nil
++			}
++			f.args = append(f.args, s)
++			continue
++		}
++
++		if s[1] == '-' {
++			if len(s) == 2 { // "--" terminates the flags
++				f.argsLenAtDash = len(f.args)
++				f.args = append(f.args, args...)
++				break
++			}
++			args, err = f.parseLongArg(s, args, fn)
++		} else {
++			args, err = f.parseShortArg(s, args, fn)
++		}
++		if err != nil {
++			return
++		}
++	}
++	return
++}
++
++// Parse parses flag definitions from the argument list, which should not
++// include the command name.  Must be called after all flags in the FlagSet
++// are defined and before flags are accessed by the program.
++// The return value will be ErrHelp if -help was set but not defined.
++func (f *FlagSet) Parse(arguments []string) error {
++	if f.addedGoFlagSets != nil {
++		for _, goFlagSet := range f.addedGoFlagSets {
++			goFlagSet.Parse(nil)
++		}
++	}
++	f.parsed = true
++
++	if len(arguments) < 0 {
++		return nil
++	}
++
++	f.args = make([]string, 0, len(arguments))
++
++	set := func(flag *Flag, value string) error {
++		return f.Set(flag.Name, value)
++	}
++
++	err := f.parseArgs(arguments, set)
++	if err != nil {
++		switch f.errorHandling {
++		case ContinueOnError:
++			return err
++		case ExitOnError:
++			fmt.Println(err)
++			os.Exit(2)
++		case PanicOnError:
++			panic(err)
++		}
++	}
++	return nil
++}
++
++type parseFunc func(flag *Flag, value string) error
++
++// ParseAll parses flag definitions from the argument list, which should not
++// include the command name. The arguments for fn are flag and value. Must be
++// called after all flags in the FlagSet are defined and before flags are
++// accessed by the program. The return value will be ErrHelp if -help was set
++// but not defined.
++func (f *FlagSet) ParseAll(arguments []string, fn func(flag *Flag, value string) error) error {
++	f.parsed = true
++	f.args = make([]string, 0, len(arguments))
++
++	err := f.parseArgs(arguments, fn)
++	if err != nil {
++		switch f.errorHandling {
++		case ContinueOnError:
++			return err
++		case ExitOnError:
++			os.Exit(2)
++		case PanicOnError:
++			panic(err)
++		}
++	}
++	return nil
++}
++
++// Parsed reports whether f.Parse has been called.
++func (f *FlagSet) Parsed() bool {
++	return f.parsed
++}
++
++// Parse parses the command-line flags from os.Args[1:].  Must be called
++// after all flags are defined and before flags are accessed by the program.
++func Parse() {
++	// Ignore errors; CommandLine is set for ExitOnError.
++	CommandLine.Parse(os.Args[1:])
++}
++
++// ParseAll parses the command-line flags from os.Args[1:] and called fn for each.
++// The arguments for fn are flag and value. Must be called after all flags are
++// defined and before flags are accessed by the program.
++func ParseAll(fn func(flag *Flag, value string) error) {
++	// Ignore errors; CommandLine is set for ExitOnError.
++	CommandLine.ParseAll(os.Args[1:], fn)
++}
++
++// SetInterspersed sets whether to support interspersed option/non-option arguments.
++func SetInterspersed(interspersed bool) {
++	CommandLine.SetInterspersed(interspersed)
++}
++
++// Parsed returns true if the command-line flags have been parsed.
++func Parsed() bool {
++	return CommandLine.Parsed()
++}
++
++// CommandLine is the default set of command-line flags, parsed from os.Args.
++var CommandLine = NewFlagSet(os.Args[0], ExitOnError)
++
++// NewFlagSet returns a new, empty flag set with the specified name,
++// error handling property and SortFlags set to true.
++func NewFlagSet(name string, errorHandling ErrorHandling) *FlagSet {
++	f := &FlagSet{
++		name:          name,
++		errorHandling: errorHandling,
++		argsLenAtDash: -1,
++		interspersed:  true,
++		SortFlags:     true,
++	}
++	return f
++}
++
++// SetInterspersed sets whether to support interspersed option/non-option arguments.
++func (f *FlagSet) SetInterspersed(interspersed bool) {
++	f.interspersed = interspersed
++}
++
++// Init sets the name and error handling property for a flag set.
++// By default, the zero FlagSet uses an empty name and the
++// ContinueOnError error handling policy.
++func (f *FlagSet) Init(name string, errorHandling ErrorHandling) {
++	f.name = name
++	f.errorHandling = errorHandling
++	f.argsLenAtDash = -1
++}
+diff --git a/thirdparty/pflag/float32.go b/thirdparty/pflag/float32.go
+new file mode 100644
+index 00000000..a243f81f
+--- /dev/null
++++ b/thirdparty/pflag/float32.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- float32 Value
++type float32Value float32
++
++func newFloat32Value(val float32, p *float32) *float32Value {
++	*p = val
++	return (*float32Value)(p)
++}
++
++func (f *float32Value) Set(s string) error {
++	v, err := strconv.ParseFloat(s, 32)
++	*f = float32Value(v)
++	return err
++}
++
++func (f *float32Value) Type() string {
++	return "float32"
++}
++
++func (f *float32Value) String() string { return strconv.FormatFloat(float64(*f), 'g', -1, 32) }
++
++func float32Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseFloat(sval, 32)
++	if err != nil {
++		return 0, err
++	}
++	return float32(v), nil
++}
++
++// GetFloat32 return the float32 value of a flag with the given name
++func (f *FlagSet) GetFloat32(name string) (float32, error) {
++	val, err := f.getFlagType(name, "float32", float32Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(float32), nil
++}
++
++// Float32Var defines a float32 flag with specified name, default value, and usage string.
++// The argument p points to a float32 variable in which to store the value of the flag.
++func (f *FlagSet) Float32Var(p *float32, name string, value float32, usage string) {
++	f.VarP(newFloat32Value(value, p), name, "", usage)
++}
++
++// Float32VarP is like Float32Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Float32VarP(p *float32, name, shorthand string, value float32, usage string) {
++	f.VarP(newFloat32Value(value, p), name, shorthand, usage)
++}
++
++// Float32Var defines a float32 flag with specified name, default value, and usage string.
++// The argument p points to a float32 variable in which to store the value of the flag.
++func Float32Var(p *float32, name string, value float32, usage string) {
++	CommandLine.VarP(newFloat32Value(value, p), name, "", usage)
++}
++
++// Float32VarP is like Float32Var, but accepts a shorthand letter that can be used after a single dash.
++func Float32VarP(p *float32, name, shorthand string, value float32, usage string) {
++	CommandLine.VarP(newFloat32Value(value, p), name, shorthand, usage)
++}
++
++// Float32 defines a float32 flag with specified name, default value, and usage string.
++// The return value is the address of a float32 variable that stores the value of the flag.
++func (f *FlagSet) Float32(name string, value float32, usage string) *float32 {
++	p := new(float32)
++	f.Float32VarP(p, name, "", value, usage)
++	return p
++}
++
++// Float32P is like Float32, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Float32P(name, shorthand string, value float32, usage string) *float32 {
++	p := new(float32)
++	f.Float32VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Float32 defines a float32 flag with specified name, default value, and usage string.
++// The return value is the address of a float32 variable that stores the value of the flag.
++func Float32(name string, value float32, usage string) *float32 {
++	return CommandLine.Float32P(name, "", value, usage)
++}
++
++// Float32P is like Float32, but accepts a shorthand letter that can be used after a single dash.
++func Float32P(name, shorthand string, value float32, usage string) *float32 {
++	return CommandLine.Float32P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/float64.go b/thirdparty/pflag/float64.go
+new file mode 100644
+index 00000000..04b5492a
+--- /dev/null
++++ b/thirdparty/pflag/float64.go
+@@ -0,0 +1,84 @@
++package pflag
++
++import "strconv"
++
++// -- float64 Value
++type float64Value float64
++
++func newFloat64Value(val float64, p *float64) *float64Value {
++	*p = val
++	return (*float64Value)(p)
++}
++
++func (f *float64Value) Set(s string) error {
++	v, err := strconv.ParseFloat(s, 64)
++	*f = float64Value(v)
++	return err
++}
++
++func (f *float64Value) Type() string {
++	return "float64"
++}
++
++func (f *float64Value) String() string { return strconv.FormatFloat(float64(*f), 'g', -1, 64) }
++
++func float64Conv(sval string) (interface{}, error) {
++	return strconv.ParseFloat(sval, 64)
++}
++
++// GetFloat64 return the float64 value of a flag with the given name
++func (f *FlagSet) GetFloat64(name string) (float64, error) {
++	val, err := f.getFlagType(name, "float64", float64Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(float64), nil
++}
++
++// Float64Var defines a float64 flag with specified name, default value, and usage string.
++// The argument p points to a float64 variable in which to store the value of the flag.
++func (f *FlagSet) Float64Var(p *float64, name string, value float64, usage string) {
++	f.VarP(newFloat64Value(value, p), name, "", usage)
++}
++
++// Float64VarP is like Float64Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Float64VarP(p *float64, name, shorthand string, value float64, usage string) {
++	f.VarP(newFloat64Value(value, p), name, shorthand, usage)
++}
++
++// Float64Var defines a float64 flag with specified name, default value, and usage string.
++// The argument p points to a float64 variable in which to store the value of the flag.
++func Float64Var(p *float64, name string, value float64, usage string) {
++	CommandLine.VarP(newFloat64Value(value, p), name, "", usage)
++}
++
++// Float64VarP is like Float64Var, but accepts a shorthand letter that can be used after a single dash.
++func Float64VarP(p *float64, name, shorthand string, value float64, usage string) {
++	CommandLine.VarP(newFloat64Value(value, p), name, shorthand, usage)
++}
++
++// Float64 defines a float64 flag with specified name, default value, and usage string.
++// The return value is the address of a float64 variable that stores the value of the flag.
++func (f *FlagSet) Float64(name string, value float64, usage string) *float64 {
++	p := new(float64)
++	f.Float64VarP(p, name, "", value, usage)
++	return p
++}
++
++// Float64P is like Float64, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Float64P(name, shorthand string, value float64, usage string) *float64 {
++	p := new(float64)
++	f.Float64VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Float64 defines a float64 flag with specified name, default value, and usage string.
++// The return value is the address of a float64 variable that stores the value of the flag.
++func Float64(name string, value float64, usage string) *float64 {
++	return CommandLine.Float64P(name, "", value, usage)
++}
++
++// Float64P is like Float64, but accepts a shorthand letter that can be used after a single dash.
++func Float64P(name, shorthand string, value float64, usage string) *float64 {
++	return CommandLine.Float64P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/go.mod b/thirdparty/pflag/go.mod
+new file mode 100644
+index 00000000..551ee17d
+--- /dev/null
++++ b/thirdparty/pflag/go.mod
+@@ -0,0 +1,3 @@
++// Go upstream includes a modified pflag in vendor
++// Added: IPNetSliceVar to pflag.FlagSet.
++module github.com/spf13/pflag
+diff --git a/thirdparty/pflag/golangflag.go b/thirdparty/pflag/golangflag.go
+new file mode 100644
+index 00000000..d3dd72b7
+--- /dev/null
++++ b/thirdparty/pflag/golangflag.go
+@@ -0,0 +1,105 @@
++// Copyright 2009 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package pflag
++
++import (
++	goflag "flag"
++	"reflect"
++	"strings"
++)
++
++// flagValueWrapper implements pflag.Value around a flag.Value.  The main
++// difference here is the addition of the Type method that returns a string
++// name of the type.  As this is generally unknown, we approximate that with
++// reflection.
++type flagValueWrapper struct {
++	inner    goflag.Value
++	flagType string
++}
++
++// We are just copying the boolFlag interface out of goflag as that is what
++// they use to decide if a flag should get "true" when no arg is given.
++type goBoolFlag interface {
++	goflag.Value
++	IsBoolFlag() bool
++}
++
++func wrapFlagValue(v goflag.Value) Value {
++	// If the flag.Value happens to also be a pflag.Value, just use it directly.
++	if pv, ok := v.(Value); ok {
++		return pv
++	}
++
++	pv := &flagValueWrapper{
++		inner: v,
++	}
++
++	t := reflect.TypeOf(v)
++	if t.Kind() == reflect.Interface || t.Kind() == reflect.Ptr {
++		t = t.Elem()
++	}
++
++	pv.flagType = strings.TrimSuffix(t.Name(), "Value")
++	return pv
++}
++
++func (v *flagValueWrapper) String() string {
++	return v.inner.String()
++}
++
++func (v *flagValueWrapper) Set(s string) error {
++	return v.inner.Set(s)
++}
++
++func (v *flagValueWrapper) Type() string {
++	return v.flagType
++}
++
++// PFlagFromGoFlag will return a *pflag.Flag given a *flag.Flag
++// If the *flag.Flag.Name was a single character (ex: `v`) it will be accessiblei
++// with both `-v` and `--v` in flags. If the golang flag was more than a single
++// character (ex: `verbose`) it will only be accessible via `--verbose`
++func PFlagFromGoFlag(goflag *goflag.Flag) *Flag {
++	// Remember the default value as a string; it won't change.
++	flag := &Flag{
++		Name:  goflag.Name,
++		Usage: goflag.Usage,
++		Value: wrapFlagValue(goflag.Value),
++		// Looks like golang flags don't set DefValue correctly  :-(
++		//DefValue: goflag.DefValue,
++		DefValue: goflag.Value.String(),
++	}
++	// Ex: if the golang flag was -v, allow both -v and --v to work
++	if len(flag.Name) == 1 {
++		flag.Shorthand = flag.Name
++	}
++	if fv, ok := goflag.Value.(goBoolFlag); ok && fv.IsBoolFlag() {
++		flag.NoOptDefVal = "true"
++	}
++	return flag
++}
++
++// AddGoFlag will add the given *flag.Flag to the pflag.FlagSet
++func (f *FlagSet) AddGoFlag(goflag *goflag.Flag) {
++	if f.Lookup(goflag.Name) != nil {
++		return
++	}
++	newflag := PFlagFromGoFlag(goflag)
++	f.AddFlag(newflag)
++}
++
++// AddGoFlagSet will add the given *flag.FlagSet to the pflag.FlagSet
++func (f *FlagSet) AddGoFlagSet(newSet *goflag.FlagSet) {
++	if newSet == nil {
++		return
++	}
++	newSet.VisitAll(func(goflag *goflag.Flag) {
++		f.AddGoFlag(goflag)
++	})
++	if f.addedGoFlagSets == nil {
++		f.addedGoFlagSets = make([]*goflag.FlagSet, 0)
++	}
++	f.addedGoFlagSets = append(f.addedGoFlagSets, newSet)
++}
+diff --git a/thirdparty/pflag/int.go b/thirdparty/pflag/int.go
+new file mode 100644
+index 00000000..1474b89d
+--- /dev/null
++++ b/thirdparty/pflag/int.go
+@@ -0,0 +1,84 @@
++package pflag
++
++import "strconv"
++
++// -- int Value
++type intValue int
++
++func newIntValue(val int, p *int) *intValue {
++	*p = val
++	return (*intValue)(p)
++}
++
++func (i *intValue) Set(s string) error {
++	v, err := strconv.ParseInt(s, 0, 64)
++	*i = intValue(v)
++	return err
++}
++
++func (i *intValue) Type() string {
++	return "int"
++}
++
++func (i *intValue) String() string { return strconv.Itoa(int(*i)) }
++
++func intConv(sval string) (interface{}, error) {
++	return strconv.Atoi(sval)
++}
++
++// GetInt return the int value of a flag with the given name
++func (f *FlagSet) GetInt(name string) (int, error) {
++	val, err := f.getFlagType(name, "int", intConv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(int), nil
++}
++
++// IntVar defines an int flag with specified name, default value, and usage string.
++// The argument p points to an int variable in which to store the value of the flag.
++func (f *FlagSet) IntVar(p *int, name string, value int, usage string) {
++	f.VarP(newIntValue(value, p), name, "", usage)
++}
++
++// IntVarP is like IntVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IntVarP(p *int, name, shorthand string, value int, usage string) {
++	f.VarP(newIntValue(value, p), name, shorthand, usage)
++}
++
++// IntVar defines an int flag with specified name, default value, and usage string.
++// The argument p points to an int variable in which to store the value of the flag.
++func IntVar(p *int, name string, value int, usage string) {
++	CommandLine.VarP(newIntValue(value, p), name, "", usage)
++}
++
++// IntVarP is like IntVar, but accepts a shorthand letter that can be used after a single dash.
++func IntVarP(p *int, name, shorthand string, value int, usage string) {
++	CommandLine.VarP(newIntValue(value, p), name, shorthand, usage)
++}
++
++// Int defines an int flag with specified name, default value, and usage string.
++// The return value is the address of an int variable that stores the value of the flag.
++func (f *FlagSet) Int(name string, value int, usage string) *int {
++	p := new(int)
++	f.IntVarP(p, name, "", value, usage)
++	return p
++}
++
++// IntP is like Int, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IntP(name, shorthand string, value int, usage string) *int {
++	p := new(int)
++	f.IntVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Int defines an int flag with specified name, default value, and usage string.
++// The return value is the address of an int variable that stores the value of the flag.
++func Int(name string, value int, usage string) *int {
++	return CommandLine.IntP(name, "", value, usage)
++}
++
++// IntP is like Int, but accepts a shorthand letter that can be used after a single dash.
++func IntP(name, shorthand string, value int, usage string) *int {
++	return CommandLine.IntP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/int16.go b/thirdparty/pflag/int16.go
+new file mode 100644
+index 00000000..f1a01d05
+--- /dev/null
++++ b/thirdparty/pflag/int16.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- int16 Value
++type int16Value int16
++
++func newInt16Value(val int16, p *int16) *int16Value {
++	*p = val
++	return (*int16Value)(p)
++}
++
++func (i *int16Value) Set(s string) error {
++	v, err := strconv.ParseInt(s, 0, 16)
++	*i = int16Value(v)
++	return err
++}
++
++func (i *int16Value) Type() string {
++	return "int16"
++}
++
++func (i *int16Value) String() string { return strconv.FormatInt(int64(*i), 10) }
++
++func int16Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseInt(sval, 0, 16)
++	if err != nil {
++		return 0, err
++	}
++	return int16(v), nil
++}
++
++// GetInt16 returns the int16 value of a flag with the given name
++func (f *FlagSet) GetInt16(name string) (int16, error) {
++	val, err := f.getFlagType(name, "int16", int16Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(int16), nil
++}
++
++// Int16Var defines an int16 flag with specified name, default value, and usage string.
++// The argument p points to an int16 variable in which to store the value of the flag.
++func (f *FlagSet) Int16Var(p *int16, name string, value int16, usage string) {
++	f.VarP(newInt16Value(value, p), name, "", usage)
++}
++
++// Int16VarP is like Int16Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int16VarP(p *int16, name, shorthand string, value int16, usage string) {
++	f.VarP(newInt16Value(value, p), name, shorthand, usage)
++}
++
++// Int16Var defines an int16 flag with specified name, default value, and usage string.
++// The argument p points to an int16 variable in which to store the value of the flag.
++func Int16Var(p *int16, name string, value int16, usage string) {
++	CommandLine.VarP(newInt16Value(value, p), name, "", usage)
++}
++
++// Int16VarP is like Int16Var, but accepts a shorthand letter that can be used after a single dash.
++func Int16VarP(p *int16, name, shorthand string, value int16, usage string) {
++	CommandLine.VarP(newInt16Value(value, p), name, shorthand, usage)
++}
++
++// Int16 defines an int16 flag with specified name, default value, and usage string.
++// The return value is the address of an int16 variable that stores the value of the flag.
++func (f *FlagSet) Int16(name string, value int16, usage string) *int16 {
++	p := new(int16)
++	f.Int16VarP(p, name, "", value, usage)
++	return p
++}
++
++// Int16P is like Int16, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int16P(name, shorthand string, value int16, usage string) *int16 {
++	p := new(int16)
++	f.Int16VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Int16 defines an int16 flag with specified name, default value, and usage string.
++// The return value is the address of an int16 variable that stores the value of the flag.
++func Int16(name string, value int16, usage string) *int16 {
++	return CommandLine.Int16P(name, "", value, usage)
++}
++
++// Int16P is like Int16, but accepts a shorthand letter that can be used after a single dash.
++func Int16P(name, shorthand string, value int16, usage string) *int16 {
++	return CommandLine.Int16P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/int32.go b/thirdparty/pflag/int32.go
+new file mode 100644
+index 00000000..9b95944f
+--- /dev/null
++++ b/thirdparty/pflag/int32.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- int32 Value
++type int32Value int32
++
++func newInt32Value(val int32, p *int32) *int32Value {
++	*p = val
++	return (*int32Value)(p)
++}
++
++func (i *int32Value) Set(s string) error {
++	v, err := strconv.ParseInt(s, 0, 32)
++	*i = int32Value(v)
++	return err
++}
++
++func (i *int32Value) Type() string {
++	return "int32"
++}
++
++func (i *int32Value) String() string { return strconv.FormatInt(int64(*i), 10) }
++
++func int32Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseInt(sval, 0, 32)
++	if err != nil {
++		return 0, err
++	}
++	return int32(v), nil
++}
++
++// GetInt32 return the int32 value of a flag with the given name
++func (f *FlagSet) GetInt32(name string) (int32, error) {
++	val, err := f.getFlagType(name, "int32", int32Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(int32), nil
++}
++
++// Int32Var defines an int32 flag with specified name, default value, and usage string.
++// The argument p points to an int32 variable in which to store the value of the flag.
++func (f *FlagSet) Int32Var(p *int32, name string, value int32, usage string) {
++	f.VarP(newInt32Value(value, p), name, "", usage)
++}
++
++// Int32VarP is like Int32Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int32VarP(p *int32, name, shorthand string, value int32, usage string) {
++	f.VarP(newInt32Value(value, p), name, shorthand, usage)
++}
++
++// Int32Var defines an int32 flag with specified name, default value, and usage string.
++// The argument p points to an int32 variable in which to store the value of the flag.
++func Int32Var(p *int32, name string, value int32, usage string) {
++	CommandLine.VarP(newInt32Value(value, p), name, "", usage)
++}
++
++// Int32VarP is like Int32Var, but accepts a shorthand letter that can be used after a single dash.
++func Int32VarP(p *int32, name, shorthand string, value int32, usage string) {
++	CommandLine.VarP(newInt32Value(value, p), name, shorthand, usage)
++}
++
++// Int32 defines an int32 flag with specified name, default value, and usage string.
++// The return value is the address of an int32 variable that stores the value of the flag.
++func (f *FlagSet) Int32(name string, value int32, usage string) *int32 {
++	p := new(int32)
++	f.Int32VarP(p, name, "", value, usage)
++	return p
++}
++
++// Int32P is like Int32, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int32P(name, shorthand string, value int32, usage string) *int32 {
++	p := new(int32)
++	f.Int32VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Int32 defines an int32 flag with specified name, default value, and usage string.
++// The return value is the address of an int32 variable that stores the value of the flag.
++func Int32(name string, value int32, usage string) *int32 {
++	return CommandLine.Int32P(name, "", value, usage)
++}
++
++// Int32P is like Int32, but accepts a shorthand letter that can be used after a single dash.
++func Int32P(name, shorthand string, value int32, usage string) *int32 {
++	return CommandLine.Int32P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/int64.go b/thirdparty/pflag/int64.go
+new file mode 100644
+index 00000000..0026d781
+--- /dev/null
++++ b/thirdparty/pflag/int64.go
+@@ -0,0 +1,84 @@
++package pflag
++
++import "strconv"
++
++// -- int64 Value
++type int64Value int64
++
++func newInt64Value(val int64, p *int64) *int64Value {
++	*p = val
++	return (*int64Value)(p)
++}
++
++func (i *int64Value) Set(s string) error {
++	v, err := strconv.ParseInt(s, 0, 64)
++	*i = int64Value(v)
++	return err
++}
++
++func (i *int64Value) Type() string {
++	return "int64"
++}
++
++func (i *int64Value) String() string { return strconv.FormatInt(int64(*i), 10) }
++
++func int64Conv(sval string) (interface{}, error) {
++	return strconv.ParseInt(sval, 0, 64)
++}
++
++// GetInt64 return the int64 value of a flag with the given name
++func (f *FlagSet) GetInt64(name string) (int64, error) {
++	val, err := f.getFlagType(name, "int64", int64Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(int64), nil
++}
++
++// Int64Var defines an int64 flag with specified name, default value, and usage string.
++// The argument p points to an int64 variable in which to store the value of the flag.
++func (f *FlagSet) Int64Var(p *int64, name string, value int64, usage string) {
++	f.VarP(newInt64Value(value, p), name, "", usage)
++}
++
++// Int64VarP is like Int64Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int64VarP(p *int64, name, shorthand string, value int64, usage string) {
++	f.VarP(newInt64Value(value, p), name, shorthand, usage)
++}
++
++// Int64Var defines an int64 flag with specified name, default value, and usage string.
++// The argument p points to an int64 variable in which to store the value of the flag.
++func Int64Var(p *int64, name string, value int64, usage string) {
++	CommandLine.VarP(newInt64Value(value, p), name, "", usage)
++}
++
++// Int64VarP is like Int64Var, but accepts a shorthand letter that can be used after a single dash.
++func Int64VarP(p *int64, name, shorthand string, value int64, usage string) {
++	CommandLine.VarP(newInt64Value(value, p), name, shorthand, usage)
++}
++
++// Int64 defines an int64 flag with specified name, default value, and usage string.
++// The return value is the address of an int64 variable that stores the value of the flag.
++func (f *FlagSet) Int64(name string, value int64, usage string) *int64 {
++	p := new(int64)
++	f.Int64VarP(p, name, "", value, usage)
++	return p
++}
++
++// Int64P is like Int64, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int64P(name, shorthand string, value int64, usage string) *int64 {
++	p := new(int64)
++	f.Int64VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Int64 defines an int64 flag with specified name, default value, and usage string.
++// The return value is the address of an int64 variable that stores the value of the flag.
++func Int64(name string, value int64, usage string) *int64 {
++	return CommandLine.Int64P(name, "", value, usage)
++}
++
++// Int64P is like Int64, but accepts a shorthand letter that can be used after a single dash.
++func Int64P(name, shorthand string, value int64, usage string) *int64 {
++	return CommandLine.Int64P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/int8.go b/thirdparty/pflag/int8.go
+new file mode 100644
+index 00000000..4da92228
+--- /dev/null
++++ b/thirdparty/pflag/int8.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- int8 Value
++type int8Value int8
++
++func newInt8Value(val int8, p *int8) *int8Value {
++	*p = val
++	return (*int8Value)(p)
++}
++
++func (i *int8Value) Set(s string) error {
++	v, err := strconv.ParseInt(s, 0, 8)
++	*i = int8Value(v)
++	return err
++}
++
++func (i *int8Value) Type() string {
++	return "int8"
++}
++
++func (i *int8Value) String() string { return strconv.FormatInt(int64(*i), 10) }
++
++func int8Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseInt(sval, 0, 8)
++	if err != nil {
++		return 0, err
++	}
++	return int8(v), nil
++}
++
++// GetInt8 return the int8 value of a flag with the given name
++func (f *FlagSet) GetInt8(name string) (int8, error) {
++	val, err := f.getFlagType(name, "int8", int8Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(int8), nil
++}
++
++// Int8Var defines an int8 flag with specified name, default value, and usage string.
++// The argument p points to an int8 variable in which to store the value of the flag.
++func (f *FlagSet) Int8Var(p *int8, name string, value int8, usage string) {
++	f.VarP(newInt8Value(value, p), name, "", usage)
++}
++
++// Int8VarP is like Int8Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int8VarP(p *int8, name, shorthand string, value int8, usage string) {
++	f.VarP(newInt8Value(value, p), name, shorthand, usage)
++}
++
++// Int8Var defines an int8 flag with specified name, default value, and usage string.
++// The argument p points to an int8 variable in which to store the value of the flag.
++func Int8Var(p *int8, name string, value int8, usage string) {
++	CommandLine.VarP(newInt8Value(value, p), name, "", usage)
++}
++
++// Int8VarP is like Int8Var, but accepts a shorthand letter that can be used after a single dash.
++func Int8VarP(p *int8, name, shorthand string, value int8, usage string) {
++	CommandLine.VarP(newInt8Value(value, p), name, shorthand, usage)
++}
++
++// Int8 defines an int8 flag with specified name, default value, and usage string.
++// The return value is the address of an int8 variable that stores the value of the flag.
++func (f *FlagSet) Int8(name string, value int8, usage string) *int8 {
++	p := new(int8)
++	f.Int8VarP(p, name, "", value, usage)
++	return p
++}
++
++// Int8P is like Int8, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Int8P(name, shorthand string, value int8, usage string) *int8 {
++	p := new(int8)
++	f.Int8VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Int8 defines an int8 flag with specified name, default value, and usage string.
++// The return value is the address of an int8 variable that stores the value of the flag.
++func Int8(name string, value int8, usage string) *int8 {
++	return CommandLine.Int8P(name, "", value, usage)
++}
++
++// Int8P is like Int8, but accepts a shorthand letter that can be used after a single dash.
++func Int8P(name, shorthand string, value int8, usage string) *int8 {
++	return CommandLine.Int8P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/int_slice.go b/thirdparty/pflag/int_slice.go
+new file mode 100644
+index 00000000..1e7c9edd
+--- /dev/null
++++ b/thirdparty/pflag/int_slice.go
+@@ -0,0 +1,128 @@
++package pflag
++
++import (
++	"fmt"
++	"strconv"
++	"strings"
++)
++
++// -- intSlice Value
++type intSliceValue struct {
++	value   *[]int
++	changed bool
++}
++
++func newIntSliceValue(val []int, p *[]int) *intSliceValue {
++	isv := new(intSliceValue)
++	isv.value = p
++	*isv.value = val
++	return isv
++}
++
++func (s *intSliceValue) Set(val string) error {
++	ss := strings.Split(val, ",")
++	out := make([]int, len(ss))
++	for i, d := range ss {
++		var err error
++		out[i], err = strconv.Atoi(d)
++		if err != nil {
++			return err
++		}
++
++	}
++	if !s.changed {
++		*s.value = out
++	} else {
++		*s.value = append(*s.value, out...)
++	}
++	s.changed = true
++	return nil
++}
++
++func (s *intSliceValue) Type() string {
++	return "intSlice"
++}
++
++func (s *intSliceValue) String() string {
++	out := make([]string, len(*s.value))
++	for i, d := range *s.value {
++		out[i] = fmt.Sprintf("%d", d)
++	}
++	return "[" + strings.Join(out, ",") + "]"
++}
++
++func intSliceConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// Empty string would cause a slice with one (empty) entry
++	if len(val) == 0 {
++		return []int{}, nil
++	}
++	ss := strings.Split(val, ",")
++	out := make([]int, len(ss))
++	for i, d := range ss {
++		var err error
++		out[i], err = strconv.Atoi(d)
++		if err != nil {
++			return nil, err
++		}
++
++	}
++	return out, nil
++}
++
++// GetIntSlice return the []int value of a flag with the given name
++func (f *FlagSet) GetIntSlice(name string) ([]int, error) {
++	val, err := f.getFlagType(name, "intSlice", intSliceConv)
++	if err != nil {
++		return []int{}, err
++	}
++	return val.([]int), nil
++}
++
++// IntSliceVar defines a intSlice flag with specified name, default value, and usage string.
++// The argument p points to a []int variable in which to store the value of the flag.
++func (f *FlagSet) IntSliceVar(p *[]int, name string, value []int, usage string) {
++	f.VarP(newIntSliceValue(value, p), name, "", usage)
++}
++
++// IntSliceVarP is like IntSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IntSliceVarP(p *[]int, name, shorthand string, value []int, usage string) {
++	f.VarP(newIntSliceValue(value, p), name, shorthand, usage)
++}
++
++// IntSliceVar defines a int[] flag with specified name, default value, and usage string.
++// The argument p points to a int[] variable in which to store the value of the flag.
++func IntSliceVar(p *[]int, name string, value []int, usage string) {
++	CommandLine.VarP(newIntSliceValue(value, p), name, "", usage)
++}
++
++// IntSliceVarP is like IntSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func IntSliceVarP(p *[]int, name, shorthand string, value []int, usage string) {
++	CommandLine.VarP(newIntSliceValue(value, p), name, shorthand, usage)
++}
++
++// IntSlice defines a []int flag with specified name, default value, and usage string.
++// The return value is the address of a []int variable that stores the value of the flag.
++func (f *FlagSet) IntSlice(name string, value []int, usage string) *[]int {
++	p := []int{}
++	f.IntSliceVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// IntSliceP is like IntSlice, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IntSliceP(name, shorthand string, value []int, usage string) *[]int {
++	p := []int{}
++	f.IntSliceVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// IntSlice defines a []int flag with specified name, default value, and usage string.
++// The return value is the address of a []int variable that stores the value of the flag.
++func IntSlice(name string, value []int, usage string) *[]int {
++	return CommandLine.IntSliceP(name, "", value, usage)
++}
++
++// IntSliceP is like IntSlice, but accepts a shorthand letter that can be used after a single dash.
++func IntSliceP(name, shorthand string, value []int, usage string) *[]int {
++	return CommandLine.IntSliceP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/ip.go b/thirdparty/pflag/ip.go
+new file mode 100644
+index 00000000..3d414ba6
+--- /dev/null
++++ b/thirdparty/pflag/ip.go
+@@ -0,0 +1,94 @@
++package pflag
++
++import (
++	"fmt"
++	"net"
++	"strings"
++)
++
++// -- net.IP value
++type ipValue net.IP
++
++func newIPValue(val net.IP, p *net.IP) *ipValue {
++	*p = val
++	return (*ipValue)(p)
++}
++
++func (i *ipValue) String() string { return net.IP(*i).String() }
++func (i *ipValue) Set(s string) error {
++	ip := net.ParseIP(strings.TrimSpace(s))
++	if ip == nil {
++		return fmt.Errorf("failed to parse IP: %q", s)
++	}
++	*i = ipValue(ip)
++	return nil
++}
++
++func (i *ipValue) Type() string {
++	return "ip"
++}
++
++func ipConv(sval string) (interface{}, error) {
++	ip := net.ParseIP(sval)
++	if ip != nil {
++		return ip, nil
++	}
++	return nil, fmt.Errorf("invalid string being converted to IP address: %s", sval)
++}
++
++// GetIP return the net.IP value of a flag with the given name
++func (f *FlagSet) GetIP(name string) (net.IP, error) {
++	val, err := f.getFlagType(name, "ip", ipConv)
++	if err != nil {
++		return nil, err
++	}
++	return val.(net.IP), nil
++}
++
++// IPVar defines an net.IP flag with specified name, default value, and usage string.
++// The argument p points to an net.IP variable in which to store the value of the flag.
++func (f *FlagSet) IPVar(p *net.IP, name string, value net.IP, usage string) {
++	f.VarP(newIPValue(value, p), name, "", usage)
++}
++
++// IPVarP is like IPVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPVarP(p *net.IP, name, shorthand string, value net.IP, usage string) {
++	f.VarP(newIPValue(value, p), name, shorthand, usage)
++}
++
++// IPVar defines an net.IP flag with specified name, default value, and usage string.
++// The argument p points to an net.IP variable in which to store the value of the flag.
++func IPVar(p *net.IP, name string, value net.IP, usage string) {
++	CommandLine.VarP(newIPValue(value, p), name, "", usage)
++}
++
++// IPVarP is like IPVar, but accepts a shorthand letter that can be used after a single dash.
++func IPVarP(p *net.IP, name, shorthand string, value net.IP, usage string) {
++	CommandLine.VarP(newIPValue(value, p), name, shorthand, usage)
++}
++
++// IP defines an net.IP flag with specified name, default value, and usage string.
++// The return value is the address of an net.IP variable that stores the value of the flag.
++func (f *FlagSet) IP(name string, value net.IP, usage string) *net.IP {
++	p := new(net.IP)
++	f.IPVarP(p, name, "", value, usage)
++	return p
++}
++
++// IPP is like IP, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPP(name, shorthand string, value net.IP, usage string) *net.IP {
++	p := new(net.IP)
++	f.IPVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// IP defines an net.IP flag with specified name, default value, and usage string.
++// The return value is the address of an net.IP variable that stores the value of the flag.
++func IP(name string, value net.IP, usage string) *net.IP {
++	return CommandLine.IPP(name, "", value, usage)
++}
++
++// IPP is like IP, but accepts a shorthand letter that can be used after a single dash.
++func IPP(name, shorthand string, value net.IP, usage string) *net.IP {
++	return CommandLine.IPP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/ip_slice.go b/thirdparty/pflag/ip_slice.go
+new file mode 100644
+index 00000000..7dd196fe
+--- /dev/null
++++ b/thirdparty/pflag/ip_slice.go
+@@ -0,0 +1,148 @@
++package pflag
++
++import (
++	"fmt"
++	"io"
++	"net"
++	"strings"
++)
++
++// -- ipSlice Value
++type ipSliceValue struct {
++	value   *[]net.IP
++	changed bool
++}
++
++func newIPSliceValue(val []net.IP, p *[]net.IP) *ipSliceValue {
++	ipsv := new(ipSliceValue)
++	ipsv.value = p
++	*ipsv.value = val
++	return ipsv
++}
++
++// Set converts, and assigns, the comma-separated IP argument string representation as the []net.IP value of this flag.
++// If Set is called on a flag that already has a []net.IP assigned, the newly converted values will be appended.
++func (s *ipSliceValue) Set(val string) error {
++
++	// remove all quote characters
++	rmQuote := strings.NewReplacer(`"`, "", `'`, "", "`", "")
++
++	// read flag arguments with CSV parser
++	ipStrSlice, err := readAsCSV(rmQuote.Replace(val))
++	if err != nil && err != io.EOF {
++		return err
++	}
++
++	// parse ip values into slice
++	out := make([]net.IP, 0, len(ipStrSlice))
++	for _, ipStr := range ipStrSlice {
++		ip := net.ParseIP(strings.TrimSpace(ipStr))
++		if ip == nil {
++			return fmt.Errorf("invalid string being converted to IP address: %s", ipStr)
++		}
++		out = append(out, ip)
++	}
++
++	if !s.changed {
++		*s.value = out
++	} else {
++		*s.value = append(*s.value, out...)
++	}
++
++	s.changed = true
++
++	return nil
++}
++
++// Type returns a string that uniquely represents this flag's type.
++func (s *ipSliceValue) Type() string {
++	return "ipSlice"
++}
++
++// String defines a "native" format for this net.IP slice flag value.
++func (s *ipSliceValue) String() string {
++
++	ipStrSlice := make([]string, len(*s.value))
++	for i, ip := range *s.value {
++		ipStrSlice[i] = ip.String()
++	}
++
++	out, _ := writeAsCSV(ipStrSlice)
++
++	return "[" + out + "]"
++}
++
++func ipSliceConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// Emtpy string would cause a slice with one (empty) entry
++	if len(val) == 0 {
++		return []net.IP{}, nil
++	}
++	ss := strings.Split(val, ",")
++	out := make([]net.IP, len(ss))
++	for i, sval := range ss {
++		ip := net.ParseIP(strings.TrimSpace(sval))
++		if ip == nil {
++			return nil, fmt.Errorf("invalid string being converted to IP address: %s", sval)
++		}
++		out[i] = ip
++	}
++	return out, nil
++}
++
++// GetIPSlice returns the []net.IP value of a flag with the given name
++func (f *FlagSet) GetIPSlice(name string) ([]net.IP, error) {
++	val, err := f.getFlagType(name, "ipSlice", ipSliceConv)
++	if err != nil {
++		return []net.IP{}, err
++	}
++	return val.([]net.IP), nil
++}
++
++// IPSliceVar defines a ipSlice flag with specified name, default value, and usage string.
++// The argument p points to a []net.IP variable in which to store the value of the flag.
++func (f *FlagSet) IPSliceVar(p *[]net.IP, name string, value []net.IP, usage string) {
++	f.VarP(newIPSliceValue(value, p), name, "", usage)
++}
++
++// IPSliceVarP is like IPSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPSliceVarP(p *[]net.IP, name, shorthand string, value []net.IP, usage string) {
++	f.VarP(newIPSliceValue(value, p), name, shorthand, usage)
++}
++
++// IPSliceVar defines a []net.IP flag with specified name, default value, and usage string.
++// The argument p points to a []net.IP variable in which to store the value of the flag.
++func IPSliceVar(p *[]net.IP, name string, value []net.IP, usage string) {
++	CommandLine.VarP(newIPSliceValue(value, p), name, "", usage)
++}
++
++// IPSliceVarP is like IPSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func IPSliceVarP(p *[]net.IP, name, shorthand string, value []net.IP, usage string) {
++	CommandLine.VarP(newIPSliceValue(value, p), name, shorthand, usage)
++}
++
++// IPSlice defines a []net.IP flag with specified name, default value, and usage string.
++// The return value is the address of a []net.IP variable that stores the value of that flag.
++func (f *FlagSet) IPSlice(name string, value []net.IP, usage string) *[]net.IP {
++	p := []net.IP{}
++	f.IPSliceVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// IPSliceP is like IPSlice, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPSliceP(name, shorthand string, value []net.IP, usage string) *[]net.IP {
++	p := []net.IP{}
++	f.IPSliceVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// IPSlice defines a []net.IP flag with specified name, default value, and usage string.
++// The return value is the address of a []net.IP variable that stores the value of the flag.
++func IPSlice(name string, value []net.IP, usage string) *[]net.IP {
++	return CommandLine.IPSliceP(name, "", value, usage)
++}
++
++// IPSliceP is like IPSlice, but accepts a shorthand letter that can be used after a single dash.
++func IPSliceP(name, shorthand string, value []net.IP, usage string) *[]net.IP {
++	return CommandLine.IPSliceP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/ipmask.go b/thirdparty/pflag/ipmask.go
+new file mode 100644
+index 00000000..5bd44bd2
+--- /dev/null
++++ b/thirdparty/pflag/ipmask.go
+@@ -0,0 +1,122 @@
++package pflag
++
++import (
++	"fmt"
++	"net"
++	"strconv"
++)
++
++// -- net.IPMask value
++type ipMaskValue net.IPMask
++
++func newIPMaskValue(val net.IPMask, p *net.IPMask) *ipMaskValue {
++	*p = val
++	return (*ipMaskValue)(p)
++}
++
++func (i *ipMaskValue) String() string { return net.IPMask(*i).String() }
++func (i *ipMaskValue) Set(s string) error {
++	ip := ParseIPv4Mask(s)
++	if ip == nil {
++		return fmt.Errorf("failed to parse IP mask: %q", s)
++	}
++	*i = ipMaskValue(ip)
++	return nil
++}
++
++func (i *ipMaskValue) Type() string {
++	return "ipMask"
++}
++
++// ParseIPv4Mask written in IP form (e.g. 255.255.255.0).
++// This function should really belong to the net package.
++func ParseIPv4Mask(s string) net.IPMask {
++	mask := net.ParseIP(s)
++	if mask == nil {
++		if len(s) != 8 {
++			return nil
++		}
++		// net.IPMask.String() actually outputs things like ffffff00
++		// so write a horrible parser for that as well  :-(
++		m := []int{}
++		for i := 0; i < 4; i++ {
++			b := "0x" + s[2*i:2*i+2]
++			d, err := strconv.ParseInt(b, 0, 0)
++			if err != nil {
++				return nil
++			}
++			m = append(m, int(d))
++		}
++		s := fmt.Sprintf("%d.%d.%d.%d", m[0], m[1], m[2], m[3])
++		mask = net.ParseIP(s)
++		if mask == nil {
++			return nil
++		}
++	}
++	return net.IPv4Mask(mask[12], mask[13], mask[14], mask[15])
++}
++
++func parseIPv4Mask(sval string) (interface{}, error) {
++	mask := ParseIPv4Mask(sval)
++	if mask == nil {
++		return nil, fmt.Errorf("unable to parse %s as net.IPMask", sval)
++	}
++	return mask, nil
++}
++
++// GetIPv4Mask return the net.IPv4Mask value of a flag with the given name
++func (f *FlagSet) GetIPv4Mask(name string) (net.IPMask, error) {
++	val, err := f.getFlagType(name, "ipMask", parseIPv4Mask)
++	if err != nil {
++		return nil, err
++	}
++	return val.(net.IPMask), nil
++}
++
++// IPMaskVar defines an net.IPMask flag with specified name, default value, and usage string.
++// The argument p points to an net.IPMask variable in which to store the value of the flag.
++func (f *FlagSet) IPMaskVar(p *net.IPMask, name string, value net.IPMask, usage string) {
++	f.VarP(newIPMaskValue(value, p), name, "", usage)
++}
++
++// IPMaskVarP is like IPMaskVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPMaskVarP(p *net.IPMask, name, shorthand string, value net.IPMask, usage string) {
++	f.VarP(newIPMaskValue(value, p), name, shorthand, usage)
++}
++
++// IPMaskVar defines an net.IPMask flag with specified name, default value, and usage string.
++// The argument p points to an net.IPMask variable in which to store the value of the flag.
++func IPMaskVar(p *net.IPMask, name string, value net.IPMask, usage string) {
++	CommandLine.VarP(newIPMaskValue(value, p), name, "", usage)
++}
++
++// IPMaskVarP is like IPMaskVar, but accepts a shorthand letter that can be used after a single dash.
++func IPMaskVarP(p *net.IPMask, name, shorthand string, value net.IPMask, usage string) {
++	CommandLine.VarP(newIPMaskValue(value, p), name, shorthand, usage)
++}
++
++// IPMask defines an net.IPMask flag with specified name, default value, and usage string.
++// The return value is the address of an net.IPMask variable that stores the value of the flag.
++func (f *FlagSet) IPMask(name string, value net.IPMask, usage string) *net.IPMask {
++	p := new(net.IPMask)
++	f.IPMaskVarP(p, name, "", value, usage)
++	return p
++}
++
++// IPMaskP is like IPMask, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPMaskP(name, shorthand string, value net.IPMask, usage string) *net.IPMask {
++	p := new(net.IPMask)
++	f.IPMaskVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// IPMask defines an net.IPMask flag with specified name, default value, and usage string.
++// The return value is the address of an net.IPMask variable that stores the value of the flag.
++func IPMask(name string, value net.IPMask, usage string) *net.IPMask {
++	return CommandLine.IPMaskP(name, "", value, usage)
++}
++
++// IPMaskP is like IP, but accepts a shorthand letter that can be used after a single dash.
++func IPMaskP(name, shorthand string, value net.IPMask, usage string) *net.IPMask {
++	return CommandLine.IPMaskP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/ipnet.go b/thirdparty/pflag/ipnet.go
+new file mode 100644
+index 00000000..e2c1b8bc
+--- /dev/null
++++ b/thirdparty/pflag/ipnet.go
+@@ -0,0 +1,98 @@
++package pflag
++
++import (
++	"fmt"
++	"net"
++	"strings"
++)
++
++// IPNet adapts net.IPNet for use as a flag.
++type ipNetValue net.IPNet
++
++func (ipnet ipNetValue) String() string {
++	n := net.IPNet(ipnet)
++	return n.String()
++}
++
++func (ipnet *ipNetValue) Set(value string) error {
++	_, n, err := net.ParseCIDR(strings.TrimSpace(value))
++	if err != nil {
++		return err
++	}
++	*ipnet = ipNetValue(*n)
++	return nil
++}
++
++func (*ipNetValue) Type() string {
++	return "ipNet"
++}
++
++func newIPNetValue(val net.IPNet, p *net.IPNet) *ipNetValue {
++	*p = val
++	return (*ipNetValue)(p)
++}
++
++func ipNetConv(sval string) (interface{}, error) {
++	_, n, err := net.ParseCIDR(strings.TrimSpace(sval))
++	if err == nil {
++		return *n, nil
++	}
++	return nil, fmt.Errorf("invalid string being converted to IPNet: %s", sval)
++}
++
++// GetIPNet return the net.IPNet value of a flag with the given name
++func (f *FlagSet) GetIPNet(name string) (net.IPNet, error) {
++	val, err := f.getFlagType(name, "ipNet", ipNetConv)
++	if err != nil {
++		return net.IPNet{}, err
++	}
++	return val.(net.IPNet), nil
++}
++
++// IPNetVar defines an net.IPNet flag with specified name, default value, and usage string.
++// The argument p points to an net.IPNet variable in which to store the value of the flag.
++func (f *FlagSet) IPNetVar(p *net.IPNet, name string, value net.IPNet, usage string) {
++	f.VarP(newIPNetValue(value, p), name, "", usage)
++}
++
++// IPNetVarP is like IPNetVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPNetVarP(p *net.IPNet, name, shorthand string, value net.IPNet, usage string) {
++	f.VarP(newIPNetValue(value, p), name, shorthand, usage)
++}
++
++// IPNetVar defines an net.IPNet flag with specified name, default value, and usage string.
++// The argument p points to an net.IPNet variable in which to store the value of the flag.
++func IPNetVar(p *net.IPNet, name string, value net.IPNet, usage string) {
++	CommandLine.VarP(newIPNetValue(value, p), name, "", usage)
++}
++
++// IPNetVarP is like IPNetVar, but accepts a shorthand letter that can be used after a single dash.
++func IPNetVarP(p *net.IPNet, name, shorthand string, value net.IPNet, usage string) {
++	CommandLine.VarP(newIPNetValue(value, p), name, shorthand, usage)
++}
++
++// IPNet defines an net.IPNet flag with specified name, default value, and usage string.
++// The return value is the address of an net.IPNet variable that stores the value of the flag.
++func (f *FlagSet) IPNet(name string, value net.IPNet, usage string) *net.IPNet {
++	p := new(net.IPNet)
++	f.IPNetVarP(p, name, "", value, usage)
++	return p
++}
++
++// IPNetP is like IPNet, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPNetP(name, shorthand string, value net.IPNet, usage string) *net.IPNet {
++	p := new(net.IPNet)
++	f.IPNetVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// IPNet defines an net.IPNet flag with specified name, default value, and usage string.
++// The return value is the address of an net.IPNet variable that stores the value of the flag.
++func IPNet(name string, value net.IPNet, usage string) *net.IPNet {
++	return CommandLine.IPNetP(name, "", value, usage)
++}
++
++// IPNetP is like IPNet, but accepts a shorthand letter that can be used after a single dash.
++func IPNetP(name, shorthand string, value net.IPNet, usage string) *net.IPNet {
++	return CommandLine.IPNetP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/ipnet_slice.go b/thirdparty/pflag/ipnet_slice.go
+new file mode 100644
+index 00000000..6b541aa8
+--- /dev/null
++++ b/thirdparty/pflag/ipnet_slice.go
+@@ -0,0 +1,147 @@
++package pflag
++
++import (
++	"fmt"
++	"io"
++	"net"
++	"strings"
++)
++
++// -- ipNetSlice Value
++type ipNetSliceValue struct {
++	value   *[]net.IPNet
++	changed bool
++}
++
++func newIPNetSliceValue(val []net.IPNet, p *[]net.IPNet) *ipNetSliceValue {
++	ipnsv := new(ipNetSliceValue)
++	ipnsv.value = p
++	*ipnsv.value = val
++	return ipnsv
++}
++
++// Set converts, and assigns, the comma-separated IPNet argument string representation as the []net.IPNet value of this flag.
++// If Set is called on a flag that already has a []net.IPNet assigned, the newly converted values will be appended.
++func (s *ipNetSliceValue) Set(val string) error {
++
++	// remove all quote characters
++	rmQuote := strings.NewReplacer(`"`, "", `'`, "", "`", "")
++
++	// read flag arguments with CSV parser
++	ipNetStrSlice, err := readAsCSV(rmQuote.Replace(val))
++	if err != nil && err != io.EOF {
++		return err
++	}
++
++	// parse ip values into slice
++	out := make([]net.IPNet, 0, len(ipNetStrSlice))
++	for _, ipNetStr := range ipNetStrSlice {
++		_, n, err := net.ParseCIDR(strings.TrimSpace(ipNetStr))
++		if err != nil {
++			return fmt.Errorf("invalid string being converted to CIDR: %s", ipNetStr)
++		}
++		out = append(out, *n)
++	}
++
++	if !s.changed {
++		*s.value = out
++	} else {
++		*s.value = append(*s.value, out...)
++	}
++
++	s.changed = true
++
++	return nil
++}
++
++// Type returns a string that uniquely represents this flag's type.
++func (s *ipNetSliceValue) Type() string {
++	return "ipNetSlice"
++}
++
++// String defines a "native" format for this net.IPNet slice flag value.
++func (s *ipNetSliceValue) String() string {
++
++	ipNetStrSlice := make([]string, len(*s.value))
++	for i, n := range *s.value {
++		ipNetStrSlice[i] = n.String()
++	}
++
++	out, _ := writeAsCSV(ipNetStrSlice)
++	return "[" + out + "]"
++}
++
++func ipNetSliceConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// Emtpy string would cause a slice with one (empty) entry
++	if len(val) == 0 {
++		return []net.IPNet{}, nil
++	}
++	ss := strings.Split(val, ",")
++	out := make([]net.IPNet, len(ss))
++	for i, sval := range ss {
++		_, n, err := net.ParseCIDR(strings.TrimSpace(sval))
++		if err != nil {
++			return nil, fmt.Errorf("invalid string being converted to CIDR: %s", sval)
++		}
++		out[i] = *n
++	}
++	return out, nil
++}
++
++// GetIPNetSlice returns the []net.IPNet value of a flag with the given name
++func (f *FlagSet) GetIPNetSlice(name string) ([]net.IPNet, error) {
++	val, err := f.getFlagType(name, "ipNetSlice", ipNetSliceConv)
++	if err != nil {
++		return []net.IPNet{}, err
++	}
++	return val.([]net.IPNet), nil
++}
++
++// IPNetSliceVar defines a ipNetSlice flag with specified name, default value, and usage string.
++// The argument p points to a []net.IPNet variable in which to store the value of the flag.
++func (f *FlagSet) IPNetSliceVar(p *[]net.IPNet, name string, value []net.IPNet, usage string) {
++	f.VarP(newIPNetSliceValue(value, p), name, "", usage)
++}
++
++// IPNetSliceVarP is like IPNetSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPNetSliceVarP(p *[]net.IPNet, name, shorthand string, value []net.IPNet, usage string) {
++	f.VarP(newIPNetSliceValue(value, p), name, shorthand, usage)
++}
++
++// IPNetSliceVar defines a []net.IPNet flag with specified name, default value, and usage string.
++// The argument p points to a []net.IPNet variable in which to store the value of the flag.
++func IPNetSliceVar(p *[]net.IPNet, name string, value []net.IPNet, usage string) {
++	CommandLine.VarP(newIPNetSliceValue(value, p), name, "", usage)
++}
++
++// IPNetSliceVarP is like IPNetSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func IPNetSliceVarP(p *[]net.IPNet, name, shorthand string, value []net.IPNet, usage string) {
++	CommandLine.VarP(newIPNetSliceValue(value, p), name, shorthand, usage)
++}
++
++// IPNetSlice defines a []net.IPNet flag with specified name, default value, and usage string.
++// The return value is the address of a []net.IPNet variable that stores the value of that flag.
++func (f *FlagSet) IPNetSlice(name string, value []net.IPNet, usage string) *[]net.IPNet {
++	p := []net.IPNet{}
++	f.IPNetSliceVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// IPNetSliceP is like IPNetSlice, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) IPNetSliceP(name, shorthand string, value []net.IPNet, usage string) *[]net.IPNet {
++	p := []net.IPNet{}
++	f.IPNetSliceVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// IPNetSlice defines a []net.IPNet flag with specified name, default value, and usage string.
++// The return value is the address of a []net.IP variable that stores the value of the flag.
++func IPNetSlice(name string, value []net.IPNet, usage string) *[]net.IPNet {
++	return CommandLine.IPNetSliceP(name, "", value, usage)
++}
++
++// IPNetSliceP is like IPNetSlice, but accepts a shorthand letter that can be used after a single dash.
++func IPNetSliceP(name, shorthand string, value []net.IPNet, usage string) *[]net.IPNet {
++	return CommandLine.IPNetSliceP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/string.go b/thirdparty/pflag/string.go
+new file mode 100644
+index 00000000..04e0a26f
+--- /dev/null
++++ b/thirdparty/pflag/string.go
+@@ -0,0 +1,80 @@
++package pflag
++
++// -- string Value
++type stringValue string
++
++func newStringValue(val string, p *string) *stringValue {
++	*p = val
++	return (*stringValue)(p)
++}
++
++func (s *stringValue) Set(val string) error {
++	*s = stringValue(val)
++	return nil
++}
++func (s *stringValue) Type() string {
++	return "string"
++}
++
++func (s *stringValue) String() string { return string(*s) }
++
++func stringConv(sval string) (interface{}, error) {
++	return sval, nil
++}
++
++// GetString return the string value of a flag with the given name
++func (f *FlagSet) GetString(name string) (string, error) {
++	val, err := f.getFlagType(name, "string", stringConv)
++	if err != nil {
++		return "", err
++	}
++	return val.(string), nil
++}
++
++// StringVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a string variable in which to store the value of the flag.
++func (f *FlagSet) StringVar(p *string, name string, value string, usage string) {
++	f.VarP(newStringValue(value, p), name, "", usage)
++}
++
++// StringVarP is like StringVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringVarP(p *string, name, shorthand string, value string, usage string) {
++	f.VarP(newStringValue(value, p), name, shorthand, usage)
++}
++
++// StringVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a string variable in which to store the value of the flag.
++func StringVar(p *string, name string, value string, usage string) {
++	CommandLine.VarP(newStringValue(value, p), name, "", usage)
++}
++
++// StringVarP is like StringVar, but accepts a shorthand letter that can be used after a single dash.
++func StringVarP(p *string, name, shorthand string, value string, usage string) {
++	CommandLine.VarP(newStringValue(value, p), name, shorthand, usage)
++}
++
++// String defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a string variable that stores the value of the flag.
++func (f *FlagSet) String(name string, value string, usage string) *string {
++	p := new(string)
++	f.StringVarP(p, name, "", value, usage)
++	return p
++}
++
++// StringP is like String, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringP(name, shorthand string, value string, usage string) *string {
++	p := new(string)
++	f.StringVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// String defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a string variable that stores the value of the flag.
++func String(name string, value string, usage string) *string {
++	return CommandLine.StringP(name, "", value, usage)
++}
++
++// StringP is like String, but accepts a shorthand letter that can be used after a single dash.
++func StringP(name, shorthand string, value string, usage string) *string {
++	return CommandLine.StringP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/string_array.go b/thirdparty/pflag/string_array.go
+new file mode 100644
+index 00000000..fa7bc601
+--- /dev/null
++++ b/thirdparty/pflag/string_array.go
+@@ -0,0 +1,103 @@
++package pflag
++
++// -- stringArray Value
++type stringArrayValue struct {
++	value   *[]string
++	changed bool
++}
++
++func newStringArrayValue(val []string, p *[]string) *stringArrayValue {
++	ssv := new(stringArrayValue)
++	ssv.value = p
++	*ssv.value = val
++	return ssv
++}
++
++func (s *stringArrayValue) Set(val string) error {
++	if !s.changed {
++		*s.value = []string{val}
++		s.changed = true
++	} else {
++		*s.value = append(*s.value, val)
++	}
++	return nil
++}
++
++func (s *stringArrayValue) Type() string {
++	return "stringArray"
++}
++
++func (s *stringArrayValue) String() string {
++	str, _ := writeAsCSV(*s.value)
++	return "[" + str + "]"
++}
++
++func stringArrayConv(sval string) (interface{}, error) {
++	sval = sval[1 : len(sval)-1]
++	// An empty string would cause a array with one (empty) string
++	if len(sval) == 0 {
++		return []string{}, nil
++	}
++	return readAsCSV(sval)
++}
++
++// GetStringArray return the []string value of a flag with the given name
++func (f *FlagSet) GetStringArray(name string) ([]string, error) {
++	val, err := f.getFlagType(name, "stringArray", stringArrayConv)
++	if err != nil {
++		return []string{}, err
++	}
++	return val.([]string), nil
++}
++
++// StringArrayVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a []string variable in which to store the values of the multiple flags.
++// The value of each argument will not try to be separated by comma. Use a StringSlice for that.
++func (f *FlagSet) StringArrayVar(p *[]string, name string, value []string, usage string) {
++	f.VarP(newStringArrayValue(value, p), name, "", usage)
++}
++
++// StringArrayVarP is like StringArrayVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringArrayVarP(p *[]string, name, shorthand string, value []string, usage string) {
++	f.VarP(newStringArrayValue(value, p), name, shorthand, usage)
++}
++
++// StringArrayVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a []string variable in which to store the value of the flag.
++// The value of each argument will not try to be separated by comma. Use a StringSlice for that.
++func StringArrayVar(p *[]string, name string, value []string, usage string) {
++	CommandLine.VarP(newStringArrayValue(value, p), name, "", usage)
++}
++
++// StringArrayVarP is like StringArrayVar, but accepts a shorthand letter that can be used after a single dash.
++func StringArrayVarP(p *[]string, name, shorthand string, value []string, usage string) {
++	CommandLine.VarP(newStringArrayValue(value, p), name, shorthand, usage)
++}
++
++// StringArray defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a []string variable that stores the value of the flag.
++// The value of each argument will not try to be separated by comma. Use a StringSlice for that.
++func (f *FlagSet) StringArray(name string, value []string, usage string) *[]string {
++	p := []string{}
++	f.StringArrayVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// StringArrayP is like StringArray, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringArrayP(name, shorthand string, value []string, usage string) *[]string {
++	p := []string{}
++	f.StringArrayVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// StringArray defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a []string variable that stores the value of the flag.
++// The value of each argument will not try to be separated by comma. Use a StringSlice for that.
++func StringArray(name string, value []string, usage string) *[]string {
++	return CommandLine.StringArrayP(name, "", value, usage)
++}
++
++// StringArrayP is like StringArray, but accepts a shorthand letter that can be used after a single dash.
++func StringArrayP(name, shorthand string, value []string, usage string) *[]string {
++	return CommandLine.StringArrayP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/string_slice.go b/thirdparty/pflag/string_slice.go
+new file mode 100644
+index 00000000..0cd3ccc0
+--- /dev/null
++++ b/thirdparty/pflag/string_slice.go
+@@ -0,0 +1,149 @@
++package pflag
++
++import (
++	"bytes"
++	"encoding/csv"
++	"strings"
++)
++
++// -- stringSlice Value
++type stringSliceValue struct {
++	value   *[]string
++	changed bool
++}
++
++func newStringSliceValue(val []string, p *[]string) *stringSliceValue {
++	ssv := new(stringSliceValue)
++	ssv.value = p
++	*ssv.value = val
++	return ssv
++}
++
++func readAsCSV(val string) ([]string, error) {
++	if val == "" {
++		return []string{}, nil
++	}
++	stringReader := strings.NewReader(val)
++	csvReader := csv.NewReader(stringReader)
++	return csvReader.Read()
++}
++
++func writeAsCSV(vals []string) (string, error) {
++	b := &bytes.Buffer{}
++	w := csv.NewWriter(b)
++	err := w.Write(vals)
++	if err != nil {
++		return "", err
++	}
++	w.Flush()
++	return strings.TrimSuffix(b.String(), "\n"), nil
++}
++
++func (s *stringSliceValue) Set(val string) error {
++	v, err := readAsCSV(val)
++	if err != nil {
++		return err
++	}
++	if !s.changed {
++		*s.value = v
++	} else {
++		*s.value = append(*s.value, v...)
++	}
++	s.changed = true
++	return nil
++}
++
++func (s *stringSliceValue) Type() string {
++	return "stringSlice"
++}
++
++func (s *stringSliceValue) String() string {
++	str, _ := writeAsCSV(*s.value)
++	return "[" + str + "]"
++}
++
++func stringSliceConv(sval string) (interface{}, error) {
++	sval = sval[1 : len(sval)-1]
++	// An empty string would cause a slice with one (empty) string
++	if len(sval) == 0 {
++		return []string{}, nil
++	}
++	return readAsCSV(sval)
++}
++
++// GetStringSlice return the []string value of a flag with the given name
++func (f *FlagSet) GetStringSlice(name string) ([]string, error) {
++	val, err := f.getFlagType(name, "stringSlice", stringSliceConv)
++	if err != nil {
++		return []string{}, err
++	}
++	return val.([]string), nil
++}
++
++// StringSliceVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a []string variable in which to store the value of the flag.
++// Compared to StringArray flags, StringSlice flags take comma-separated value as arguments and split them accordingly.
++// For example:
++//   --ss="v1,v2" -ss="v3"
++// will result in
++//   []string{"v1", "v2", "v3"}
++func (f *FlagSet) StringSliceVar(p *[]string, name string, value []string, usage string) {
++	f.VarP(newStringSliceValue(value, p), name, "", usage)
++}
++
++// StringSliceVarP is like StringSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringSliceVarP(p *[]string, name, shorthand string, value []string, usage string) {
++	f.VarP(newStringSliceValue(value, p), name, shorthand, usage)
++}
++
++// StringSliceVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a []string variable in which to store the value of the flag.
++// Compared to StringArray flags, StringSlice flags take comma-separated value as arguments and split them accordingly.
++// For example:
++//   --ss="v1,v2" -ss="v3"
++// will result in
++//   []string{"v1", "v2", "v3"}
++func StringSliceVar(p *[]string, name string, value []string, usage string) {
++	CommandLine.VarP(newStringSliceValue(value, p), name, "", usage)
++}
++
++// StringSliceVarP is like StringSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func StringSliceVarP(p *[]string, name, shorthand string, value []string, usage string) {
++	CommandLine.VarP(newStringSliceValue(value, p), name, shorthand, usage)
++}
++
++// StringSlice defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a []string variable that stores the value of the flag.
++// Compared to StringArray flags, StringSlice flags take comma-separated value as arguments and split them accordingly.
++// For example:
++//   --ss="v1,v2" -ss="v3"
++// will result in
++//   []string{"v1", "v2", "v3"}
++func (f *FlagSet) StringSlice(name string, value []string, usage string) *[]string {
++	p := []string{}
++	f.StringSliceVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// StringSliceP is like StringSlice, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringSliceP(name, shorthand string, value []string, usage string) *[]string {
++	p := []string{}
++	f.StringSliceVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// StringSlice defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a []string variable that stores the value of the flag.
++// Compared to StringArray flags, StringSlice flags take comma-separated value as arguments and split them accordingly.
++// For example:
++//   --ss="v1,v2" -ss="v3"
++// will result in
++//   []string{"v1", "v2", "v3"}
++func StringSlice(name string, value []string, usage string) *[]string {
++	return CommandLine.StringSliceP(name, "", value, usage)
++}
++
++// StringSliceP is like StringSlice, but accepts a shorthand letter that can be used after a single dash.
++func StringSliceP(name, shorthand string, value []string, usage string) *[]string {
++	return CommandLine.StringSliceP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/string_to_int.go b/thirdparty/pflag/string_to_int.go
+new file mode 100644
+index 00000000..5ceda396
+--- /dev/null
++++ b/thirdparty/pflag/string_to_int.go
+@@ -0,0 +1,149 @@
++package pflag
++
++import (
++	"bytes"
++	"fmt"
++	"strconv"
++	"strings"
++)
++
++// -- stringToInt Value
++type stringToIntValue struct {
++	value   *map[string]int
++	changed bool
++}
++
++func newStringToIntValue(val map[string]int, p *map[string]int) *stringToIntValue {
++	ssv := new(stringToIntValue)
++	ssv.value = p
++	*ssv.value = val
++	return ssv
++}
++
++// Format: a=1,b=2
++func (s *stringToIntValue) Set(val string) error {
++	ss := strings.Split(val, ",")
++	out := make(map[string]int, len(ss))
++	for _, pair := range ss {
++		kv := strings.SplitN(pair, "=", 2)
++		if len(kv) != 2 {
++			return fmt.Errorf("%s must be formatted as key=value", pair)
++		}
++		var err error
++		out[kv[0]], err = strconv.Atoi(kv[1])
++		if err != nil {
++			return err
++		}
++	}
++	if !s.changed {
++		*s.value = out
++	} else {
++		for k, v := range out {
++			(*s.value)[k] = v
++		}
++	}
++	s.changed = true
++	return nil
++}
++
++func (s *stringToIntValue) Type() string {
++	return "stringToInt"
++}
++
++func (s *stringToIntValue) String() string {
++	var buf bytes.Buffer
++	i := 0
++	for k, v := range *s.value {
++		if i > 0 {
++			buf.WriteRune(',')
++		}
++		buf.WriteString(k)
++		buf.WriteRune('=')
++		buf.WriteString(strconv.Itoa(v))
++		i++
++	}
++	return "[" + buf.String() + "]"
++}
++
++func stringToIntConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// An empty string would cause an empty map
++	if len(val) == 0 {
++		return map[string]int{}, nil
++	}
++	ss := strings.Split(val, ",")
++	out := make(map[string]int, len(ss))
++	for _, pair := range ss {
++		kv := strings.SplitN(pair, "=", 2)
++		if len(kv) != 2 {
++			return nil, fmt.Errorf("%s must be formatted as key=value", pair)
++		}
++		var err error
++		out[kv[0]], err = strconv.Atoi(kv[1])
++		if err != nil {
++			return nil, err
++		}
++	}
++	return out, nil
++}
++
++// GetStringToInt return the map[string]int value of a flag with the given name
++func (f *FlagSet) GetStringToInt(name string) (map[string]int, error) {
++	val, err := f.getFlagType(name, "stringToInt", stringToIntConv)
++	if err != nil {
++		return map[string]int{}, err
++	}
++	return val.(map[string]int), nil
++}
++
++// StringToIntVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a map[string]int variable in which to store the values of the multiple flags.
++// The value of each argument will not try to be separated by comma
++func (f *FlagSet) StringToIntVar(p *map[string]int, name string, value map[string]int, usage string) {
++	f.VarP(newStringToIntValue(value, p), name, "", usage)
++}
++
++// StringToIntVarP is like StringToIntVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringToIntVarP(p *map[string]int, name, shorthand string, value map[string]int, usage string) {
++	f.VarP(newStringToIntValue(value, p), name, shorthand, usage)
++}
++
++// StringToIntVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a map[string]int variable in which to store the value of the flag.
++// The value of each argument will not try to be separated by comma
++func StringToIntVar(p *map[string]int, name string, value map[string]int, usage string) {
++	CommandLine.VarP(newStringToIntValue(value, p), name, "", usage)
++}
++
++// StringToIntVarP is like StringToIntVar, but accepts a shorthand letter that can be used after a single dash.
++func StringToIntVarP(p *map[string]int, name, shorthand string, value map[string]int, usage string) {
++	CommandLine.VarP(newStringToIntValue(value, p), name, shorthand, usage)
++}
++
++// StringToInt defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a map[string]int variable that stores the value of the flag.
++// The value of each argument will not try to be separated by comma
++func (f *FlagSet) StringToInt(name string, value map[string]int, usage string) *map[string]int {
++	p := map[string]int{}
++	f.StringToIntVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// StringToIntP is like StringToInt, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringToIntP(name, shorthand string, value map[string]int, usage string) *map[string]int {
++	p := map[string]int{}
++	f.StringToIntVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// StringToInt defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a map[string]int variable that stores the value of the flag.
++// The value of each argument will not try to be separated by comma
++func StringToInt(name string, value map[string]int, usage string) *map[string]int {
++	return CommandLine.StringToIntP(name, "", value, usage)
++}
++
++// StringToIntP is like StringToInt, but accepts a shorthand letter that can be used after a single dash.
++func StringToIntP(name, shorthand string, value map[string]int, usage string) *map[string]int {
++	return CommandLine.StringToIntP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/string_to_string.go b/thirdparty/pflag/string_to_string.go
+new file mode 100644
+index 00000000..890a01af
+--- /dev/null
++++ b/thirdparty/pflag/string_to_string.go
+@@ -0,0 +1,160 @@
++package pflag
++
++import (
++	"bytes"
++	"encoding/csv"
++	"fmt"
++	"strings"
++)
++
++// -- stringToString Value
++type stringToStringValue struct {
++	value   *map[string]string
++	changed bool
++}
++
++func newStringToStringValue(val map[string]string, p *map[string]string) *stringToStringValue {
++	ssv := new(stringToStringValue)
++	ssv.value = p
++	*ssv.value = val
++	return ssv
++}
++
++// Format: a=1,b=2
++func (s *stringToStringValue) Set(val string) error {
++	var ss []string
++	n := strings.Count(val, "=")
++	switch n {
++	case 0:
++		return fmt.Errorf("%s must be formatted as key=value", val)
++	case 1:
++		ss = append(ss, strings.Trim(val, `"`))
++	default:
++		r := csv.NewReader(strings.NewReader(val))
++		var err error
++		ss, err = r.Read()
++		if err != nil {
++			return err
++		}
++	}
++
++	out := make(map[string]string, len(ss))
++	for _, pair := range ss {
++		kv := strings.SplitN(pair, "=", 2)
++		if len(kv) != 2 {
++			return fmt.Errorf("%s must be formatted as key=value", pair)
++		}
++		out[kv[0]] = kv[1]
++	}
++	if !s.changed {
++		*s.value = out
++	} else {
++		for k, v := range out {
++			(*s.value)[k] = v
++		}
++	}
++	s.changed = true
++	return nil
++}
++
++func (s *stringToStringValue) Type() string {
++	return "stringToString"
++}
++
++func (s *stringToStringValue) String() string {
++	records := make([]string, 0, len(*s.value)>>1)
++	for k, v := range *s.value {
++		records = append(records, k+"="+v)
++	}
++
++	var buf bytes.Buffer
++	w := csv.NewWriter(&buf)
++	if err := w.Write(records); err != nil {
++		panic(err)
++	}
++	w.Flush()
++	return "[" + strings.TrimSpace(buf.String()) + "]"
++}
++
++func stringToStringConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// An empty string would cause an empty map
++	if len(val) == 0 {
++		return map[string]string{}, nil
++	}
++	r := csv.NewReader(strings.NewReader(val))
++	ss, err := r.Read()
++	if err != nil {
++		return nil, err
++	}
++	out := make(map[string]string, len(ss))
++	for _, pair := range ss {
++		kv := strings.SplitN(pair, "=", 2)
++		if len(kv) != 2 {
++			return nil, fmt.Errorf("%s must be formatted as key=value", pair)
++		}
++		out[kv[0]] = kv[1]
++	}
++	return out, nil
++}
++
++// GetStringToString return the map[string]string value of a flag with the given name
++func (f *FlagSet) GetStringToString(name string) (map[string]string, error) {
++	val, err := f.getFlagType(name, "stringToString", stringToStringConv)
++	if err != nil {
++		return map[string]string{}, err
++	}
++	return val.(map[string]string), nil
++}
++
++// StringToStringVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a map[string]string variable in which to store the values of the multiple flags.
++// The value of each argument will not try to be separated by comma
++func (f *FlagSet) StringToStringVar(p *map[string]string, name string, value map[string]string, usage string) {
++	f.VarP(newStringToStringValue(value, p), name, "", usage)
++}
++
++// StringToStringVarP is like StringToStringVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringToStringVarP(p *map[string]string, name, shorthand string, value map[string]string, usage string) {
++	f.VarP(newStringToStringValue(value, p), name, shorthand, usage)
++}
++
++// StringToStringVar defines a string flag with specified name, default value, and usage string.
++// The argument p points to a map[string]string variable in which to store the value of the flag.
++// The value of each argument will not try to be separated by comma
++func StringToStringVar(p *map[string]string, name string, value map[string]string, usage string) {
++	CommandLine.VarP(newStringToStringValue(value, p), name, "", usage)
++}
++
++// StringToStringVarP is like StringToStringVar, but accepts a shorthand letter that can be used after a single dash.
++func StringToStringVarP(p *map[string]string, name, shorthand string, value map[string]string, usage string) {
++	CommandLine.VarP(newStringToStringValue(value, p), name, shorthand, usage)
++}
++
++// StringToString defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a map[string]string variable that stores the value of the flag.
++// The value of each argument will not try to be separated by comma
++func (f *FlagSet) StringToString(name string, value map[string]string, usage string) *map[string]string {
++	p := map[string]string{}
++	f.StringToStringVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// StringToStringP is like StringToString, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) StringToStringP(name, shorthand string, value map[string]string, usage string) *map[string]string {
++	p := map[string]string{}
++	f.StringToStringVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// StringToString defines a string flag with specified name, default value, and usage string.
++// The return value is the address of a map[string]string variable that stores the value of the flag.
++// The value of each argument will not try to be separated by comma
++func StringToString(name string, value map[string]string, usage string) *map[string]string {
++	return CommandLine.StringToStringP(name, "", value, usage)
++}
++
++// StringToStringP is like StringToString, but accepts a shorthand letter that can be used after a single dash.
++func StringToStringP(name, shorthand string, value map[string]string, usage string) *map[string]string {
++	return CommandLine.StringToStringP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/uint.go b/thirdparty/pflag/uint.go
+new file mode 100644
+index 00000000..dcbc2b75
+--- /dev/null
++++ b/thirdparty/pflag/uint.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- uint Value
++type uintValue uint
++
++func newUintValue(val uint, p *uint) *uintValue {
++	*p = val
++	return (*uintValue)(p)
++}
++
++func (i *uintValue) Set(s string) error {
++	v, err := strconv.ParseUint(s, 0, 64)
++	*i = uintValue(v)
++	return err
++}
++
++func (i *uintValue) Type() string {
++	return "uint"
++}
++
++func (i *uintValue) String() string { return strconv.FormatUint(uint64(*i), 10) }
++
++func uintConv(sval string) (interface{}, error) {
++	v, err := strconv.ParseUint(sval, 0, 0)
++	if err != nil {
++		return 0, err
++	}
++	return uint(v), nil
++}
++
++// GetUint return the uint value of a flag with the given name
++func (f *FlagSet) GetUint(name string) (uint, error) {
++	val, err := f.getFlagType(name, "uint", uintConv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(uint), nil
++}
++
++// UintVar defines a uint flag with specified name, default value, and usage string.
++// The argument p points to a uint variable in which to store the value of the flag.
++func (f *FlagSet) UintVar(p *uint, name string, value uint, usage string) {
++	f.VarP(newUintValue(value, p), name, "", usage)
++}
++
++// UintVarP is like UintVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) UintVarP(p *uint, name, shorthand string, value uint, usage string) {
++	f.VarP(newUintValue(value, p), name, shorthand, usage)
++}
++
++// UintVar defines a uint flag with specified name, default value, and usage string.
++// The argument p points to a uint  variable in which to store the value of the flag.
++func UintVar(p *uint, name string, value uint, usage string) {
++	CommandLine.VarP(newUintValue(value, p), name, "", usage)
++}
++
++// UintVarP is like UintVar, but accepts a shorthand letter that can be used after a single dash.
++func UintVarP(p *uint, name, shorthand string, value uint, usage string) {
++	CommandLine.VarP(newUintValue(value, p), name, shorthand, usage)
++}
++
++// Uint defines a uint flag with specified name, default value, and usage string.
++// The return value is the address of a uint  variable that stores the value of the flag.
++func (f *FlagSet) Uint(name string, value uint, usage string) *uint {
++	p := new(uint)
++	f.UintVarP(p, name, "", value, usage)
++	return p
++}
++
++// UintP is like Uint, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) UintP(name, shorthand string, value uint, usage string) *uint {
++	p := new(uint)
++	f.UintVarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Uint defines a uint flag with specified name, default value, and usage string.
++// The return value is the address of a uint  variable that stores the value of the flag.
++func Uint(name string, value uint, usage string) *uint {
++	return CommandLine.UintP(name, "", value, usage)
++}
++
++// UintP is like Uint, but accepts a shorthand letter that can be used after a single dash.
++func UintP(name, shorthand string, value uint, usage string) *uint {
++	return CommandLine.UintP(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/uint16.go b/thirdparty/pflag/uint16.go
+new file mode 100644
+index 00000000..7e9914ed
+--- /dev/null
++++ b/thirdparty/pflag/uint16.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- uint16 value
++type uint16Value uint16
++
++func newUint16Value(val uint16, p *uint16) *uint16Value {
++	*p = val
++	return (*uint16Value)(p)
++}
++
++func (i *uint16Value) Set(s string) error {
++	v, err := strconv.ParseUint(s, 0, 16)
++	*i = uint16Value(v)
++	return err
++}
++
++func (i *uint16Value) Type() string {
++	return "uint16"
++}
++
++func (i *uint16Value) String() string { return strconv.FormatUint(uint64(*i), 10) }
++
++func uint16Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseUint(sval, 0, 16)
++	if err != nil {
++		return 0, err
++	}
++	return uint16(v), nil
++}
++
++// GetUint16 return the uint16 value of a flag with the given name
++func (f *FlagSet) GetUint16(name string) (uint16, error) {
++	val, err := f.getFlagType(name, "uint16", uint16Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(uint16), nil
++}
++
++// Uint16Var defines a uint flag with specified name, default value, and usage string.
++// The argument p points to a uint variable in which to store the value of the flag.
++func (f *FlagSet) Uint16Var(p *uint16, name string, value uint16, usage string) {
++	f.VarP(newUint16Value(value, p), name, "", usage)
++}
++
++// Uint16VarP is like Uint16Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint16VarP(p *uint16, name, shorthand string, value uint16, usage string) {
++	f.VarP(newUint16Value(value, p), name, shorthand, usage)
++}
++
++// Uint16Var defines a uint flag with specified name, default value, and usage string.
++// The argument p points to a uint  variable in which to store the value of the flag.
++func Uint16Var(p *uint16, name string, value uint16, usage string) {
++	CommandLine.VarP(newUint16Value(value, p), name, "", usage)
++}
++
++// Uint16VarP is like Uint16Var, but accepts a shorthand letter that can be used after a single dash.
++func Uint16VarP(p *uint16, name, shorthand string, value uint16, usage string) {
++	CommandLine.VarP(newUint16Value(value, p), name, shorthand, usage)
++}
++
++// Uint16 defines a uint flag with specified name, default value, and usage string.
++// The return value is the address of a uint  variable that stores the value of the flag.
++func (f *FlagSet) Uint16(name string, value uint16, usage string) *uint16 {
++	p := new(uint16)
++	f.Uint16VarP(p, name, "", value, usage)
++	return p
++}
++
++// Uint16P is like Uint16, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint16P(name, shorthand string, value uint16, usage string) *uint16 {
++	p := new(uint16)
++	f.Uint16VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Uint16 defines a uint flag with specified name, default value, and usage string.
++// The return value is the address of a uint  variable that stores the value of the flag.
++func Uint16(name string, value uint16, usage string) *uint16 {
++	return CommandLine.Uint16P(name, "", value, usage)
++}
++
++// Uint16P is like Uint16, but accepts a shorthand letter that can be used after a single dash.
++func Uint16P(name, shorthand string, value uint16, usage string) *uint16 {
++	return CommandLine.Uint16P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/uint32.go b/thirdparty/pflag/uint32.go
+new file mode 100644
+index 00000000..d8024539
+--- /dev/null
++++ b/thirdparty/pflag/uint32.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- uint32 value
++type uint32Value uint32
++
++func newUint32Value(val uint32, p *uint32) *uint32Value {
++	*p = val
++	return (*uint32Value)(p)
++}
++
++func (i *uint32Value) Set(s string) error {
++	v, err := strconv.ParseUint(s, 0, 32)
++	*i = uint32Value(v)
++	return err
++}
++
++func (i *uint32Value) Type() string {
++	return "uint32"
++}
++
++func (i *uint32Value) String() string { return strconv.FormatUint(uint64(*i), 10) }
++
++func uint32Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseUint(sval, 0, 32)
++	if err != nil {
++		return 0, err
++	}
++	return uint32(v), nil
++}
++
++// GetUint32 return the uint32 value of a flag with the given name
++func (f *FlagSet) GetUint32(name string) (uint32, error) {
++	val, err := f.getFlagType(name, "uint32", uint32Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(uint32), nil
++}
++
++// Uint32Var defines a uint32 flag with specified name, default value, and usage string.
++// The argument p points to a uint32 variable in which to store the value of the flag.
++func (f *FlagSet) Uint32Var(p *uint32, name string, value uint32, usage string) {
++	f.VarP(newUint32Value(value, p), name, "", usage)
++}
++
++// Uint32VarP is like Uint32Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint32VarP(p *uint32, name, shorthand string, value uint32, usage string) {
++	f.VarP(newUint32Value(value, p), name, shorthand, usage)
++}
++
++// Uint32Var defines a uint32 flag with specified name, default value, and usage string.
++// The argument p points to a uint32  variable in which to store the value of the flag.
++func Uint32Var(p *uint32, name string, value uint32, usage string) {
++	CommandLine.VarP(newUint32Value(value, p), name, "", usage)
++}
++
++// Uint32VarP is like Uint32Var, but accepts a shorthand letter that can be used after a single dash.
++func Uint32VarP(p *uint32, name, shorthand string, value uint32, usage string) {
++	CommandLine.VarP(newUint32Value(value, p), name, shorthand, usage)
++}
++
++// Uint32 defines a uint32 flag with specified name, default value, and usage string.
++// The return value is the address of a uint32  variable that stores the value of the flag.
++func (f *FlagSet) Uint32(name string, value uint32, usage string) *uint32 {
++	p := new(uint32)
++	f.Uint32VarP(p, name, "", value, usage)
++	return p
++}
++
++// Uint32P is like Uint32, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint32P(name, shorthand string, value uint32, usage string) *uint32 {
++	p := new(uint32)
++	f.Uint32VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Uint32 defines a uint32 flag with specified name, default value, and usage string.
++// The return value is the address of a uint32  variable that stores the value of the flag.
++func Uint32(name string, value uint32, usage string) *uint32 {
++	return CommandLine.Uint32P(name, "", value, usage)
++}
++
++// Uint32P is like Uint32, but accepts a shorthand letter that can be used after a single dash.
++func Uint32P(name, shorthand string, value uint32, usage string) *uint32 {
++	return CommandLine.Uint32P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/uint64.go b/thirdparty/pflag/uint64.go
+new file mode 100644
+index 00000000..f62240f2
+--- /dev/null
++++ b/thirdparty/pflag/uint64.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- uint64 Value
++type uint64Value uint64
++
++func newUint64Value(val uint64, p *uint64) *uint64Value {
++	*p = val
++	return (*uint64Value)(p)
++}
++
++func (i *uint64Value) Set(s string) error {
++	v, err := strconv.ParseUint(s, 0, 64)
++	*i = uint64Value(v)
++	return err
++}
++
++func (i *uint64Value) Type() string {
++	return "uint64"
++}
++
++func (i *uint64Value) String() string { return strconv.FormatUint(uint64(*i), 10) }
++
++func uint64Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseUint(sval, 0, 64)
++	if err != nil {
++		return 0, err
++	}
++	return uint64(v), nil
++}
++
++// GetUint64 return the uint64 value of a flag with the given name
++func (f *FlagSet) GetUint64(name string) (uint64, error) {
++	val, err := f.getFlagType(name, "uint64", uint64Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(uint64), nil
++}
++
++// Uint64Var defines a uint64 flag with specified name, default value, and usage string.
++// The argument p points to a uint64 variable in which to store the value of the flag.
++func (f *FlagSet) Uint64Var(p *uint64, name string, value uint64, usage string) {
++	f.VarP(newUint64Value(value, p), name, "", usage)
++}
++
++// Uint64VarP is like Uint64Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint64VarP(p *uint64, name, shorthand string, value uint64, usage string) {
++	f.VarP(newUint64Value(value, p), name, shorthand, usage)
++}
++
++// Uint64Var defines a uint64 flag with specified name, default value, and usage string.
++// The argument p points to a uint64 variable in which to store the value of the flag.
++func Uint64Var(p *uint64, name string, value uint64, usage string) {
++	CommandLine.VarP(newUint64Value(value, p), name, "", usage)
++}
++
++// Uint64VarP is like Uint64Var, but accepts a shorthand letter that can be used after a single dash.
++func Uint64VarP(p *uint64, name, shorthand string, value uint64, usage string) {
++	CommandLine.VarP(newUint64Value(value, p), name, shorthand, usage)
++}
++
++// Uint64 defines a uint64 flag with specified name, default value, and usage string.
++// The return value is the address of a uint64 variable that stores the value of the flag.
++func (f *FlagSet) Uint64(name string, value uint64, usage string) *uint64 {
++	p := new(uint64)
++	f.Uint64VarP(p, name, "", value, usage)
++	return p
++}
++
++// Uint64P is like Uint64, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint64P(name, shorthand string, value uint64, usage string) *uint64 {
++	p := new(uint64)
++	f.Uint64VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Uint64 defines a uint64 flag with specified name, default value, and usage string.
++// The return value is the address of a uint64 variable that stores the value of the flag.
++func Uint64(name string, value uint64, usage string) *uint64 {
++	return CommandLine.Uint64P(name, "", value, usage)
++}
++
++// Uint64P is like Uint64, but accepts a shorthand letter that can be used after a single dash.
++func Uint64P(name, shorthand string, value uint64, usage string) *uint64 {
++	return CommandLine.Uint64P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/uint8.go b/thirdparty/pflag/uint8.go
+new file mode 100644
+index 00000000..bb0e83c1
+--- /dev/null
++++ b/thirdparty/pflag/uint8.go
+@@ -0,0 +1,88 @@
++package pflag
++
++import "strconv"
++
++// -- uint8 Value
++type uint8Value uint8
++
++func newUint8Value(val uint8, p *uint8) *uint8Value {
++	*p = val
++	return (*uint8Value)(p)
++}
++
++func (i *uint8Value) Set(s string) error {
++	v, err := strconv.ParseUint(s, 0, 8)
++	*i = uint8Value(v)
++	return err
++}
++
++func (i *uint8Value) Type() string {
++	return "uint8"
++}
++
++func (i *uint8Value) String() string { return strconv.FormatUint(uint64(*i), 10) }
++
++func uint8Conv(sval string) (interface{}, error) {
++	v, err := strconv.ParseUint(sval, 0, 8)
++	if err != nil {
++		return 0, err
++	}
++	return uint8(v), nil
++}
++
++// GetUint8 return the uint8 value of a flag with the given name
++func (f *FlagSet) GetUint8(name string) (uint8, error) {
++	val, err := f.getFlagType(name, "uint8", uint8Conv)
++	if err != nil {
++		return 0, err
++	}
++	return val.(uint8), nil
++}
++
++// Uint8Var defines a uint8 flag with specified name, default value, and usage string.
++// The argument p points to a uint8 variable in which to store the value of the flag.
++func (f *FlagSet) Uint8Var(p *uint8, name string, value uint8, usage string) {
++	f.VarP(newUint8Value(value, p), name, "", usage)
++}
++
++// Uint8VarP is like Uint8Var, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint8VarP(p *uint8, name, shorthand string, value uint8, usage string) {
++	f.VarP(newUint8Value(value, p), name, shorthand, usage)
++}
++
++// Uint8Var defines a uint8 flag with specified name, default value, and usage string.
++// The argument p points to a uint8 variable in which to store the value of the flag.
++func Uint8Var(p *uint8, name string, value uint8, usage string) {
++	CommandLine.VarP(newUint8Value(value, p), name, "", usage)
++}
++
++// Uint8VarP is like Uint8Var, but accepts a shorthand letter that can be used after a single dash.
++func Uint8VarP(p *uint8, name, shorthand string, value uint8, usage string) {
++	CommandLine.VarP(newUint8Value(value, p), name, shorthand, usage)
++}
++
++// Uint8 defines a uint8 flag with specified name, default value, and usage string.
++// The return value is the address of a uint8 variable that stores the value of the flag.
++func (f *FlagSet) Uint8(name string, value uint8, usage string) *uint8 {
++	p := new(uint8)
++	f.Uint8VarP(p, name, "", value, usage)
++	return p
++}
++
++// Uint8P is like Uint8, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) Uint8P(name, shorthand string, value uint8, usage string) *uint8 {
++	p := new(uint8)
++	f.Uint8VarP(p, name, shorthand, value, usage)
++	return p
++}
++
++// Uint8 defines a uint8 flag with specified name, default value, and usage string.
++// The return value is the address of a uint8 variable that stores the value of the flag.
++func Uint8(name string, value uint8, usage string) *uint8 {
++	return CommandLine.Uint8P(name, "", value, usage)
++}
++
++// Uint8P is like Uint8, but accepts a shorthand letter that can be used after a single dash.
++func Uint8P(name, shorthand string, value uint8, usage string) *uint8 {
++	return CommandLine.Uint8P(name, shorthand, value, usage)
++}
+diff --git a/thirdparty/pflag/uint_slice.go b/thirdparty/pflag/uint_slice.go
+new file mode 100644
+index 00000000..edd94c60
+--- /dev/null
++++ b/thirdparty/pflag/uint_slice.go
+@@ -0,0 +1,126 @@
++package pflag
++
++import (
++	"fmt"
++	"strconv"
++	"strings"
++)
++
++// -- uintSlice Value
++type uintSliceValue struct {
++	value   *[]uint
++	changed bool
++}
++
++func newUintSliceValue(val []uint, p *[]uint) *uintSliceValue {
++	uisv := new(uintSliceValue)
++	uisv.value = p
++	*uisv.value = val
++	return uisv
++}
++
++func (s *uintSliceValue) Set(val string) error {
++	ss := strings.Split(val, ",")
++	out := make([]uint, len(ss))
++	for i, d := range ss {
++		u, err := strconv.ParseUint(d, 10, 0)
++		if err != nil {
++			return err
++		}
++		out[i] = uint(u)
++	}
++	if !s.changed {
++		*s.value = out
++	} else {
++		*s.value = append(*s.value, out...)
++	}
++	s.changed = true
++	return nil
++}
++
++func (s *uintSliceValue) Type() string {
++	return "uintSlice"
++}
++
++func (s *uintSliceValue) String() string {
++	out := make([]string, len(*s.value))
++	for i, d := range *s.value {
++		out[i] = fmt.Sprintf("%d", d)
++	}
++	return "[" + strings.Join(out, ",") + "]"
++}
++
++func uintSliceConv(val string) (interface{}, error) {
++	val = strings.Trim(val, "[]")
++	// Empty string would cause a slice with one (empty) entry
++	if len(val) == 0 {
++		return []uint{}, nil
++	}
++	ss := strings.Split(val, ",")
++	out := make([]uint, len(ss))
++	for i, d := range ss {
++		u, err := strconv.ParseUint(d, 10, 0)
++		if err != nil {
++			return nil, err
++		}
++		out[i] = uint(u)
++	}
++	return out, nil
++}
++
++// GetUintSlice returns the []uint value of a flag with the given name.
++func (f *FlagSet) GetUintSlice(name string) ([]uint, error) {
++	val, err := f.getFlagType(name, "uintSlice", uintSliceConv)
++	if err != nil {
++		return []uint{}, err
++	}
++	return val.([]uint), nil
++}
++
++// UintSliceVar defines a uintSlice flag with specified name, default value, and usage string.
++// The argument p points to a []uint variable in which to store the value of the flag.
++func (f *FlagSet) UintSliceVar(p *[]uint, name string, value []uint, usage string) {
++	f.VarP(newUintSliceValue(value, p), name, "", usage)
++}
++
++// UintSliceVarP is like UintSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) UintSliceVarP(p *[]uint, name, shorthand string, value []uint, usage string) {
++	f.VarP(newUintSliceValue(value, p), name, shorthand, usage)
++}
++
++// UintSliceVar defines a uint[] flag with specified name, default value, and usage string.
++// The argument p points to a uint[] variable in which to store the value of the flag.
++func UintSliceVar(p *[]uint, name string, value []uint, usage string) {
++	CommandLine.VarP(newUintSliceValue(value, p), name, "", usage)
++}
++
++// UintSliceVarP is like the UintSliceVar, but accepts a shorthand letter that can be used after a single dash.
++func UintSliceVarP(p *[]uint, name, shorthand string, value []uint, usage string) {
++	CommandLine.VarP(newUintSliceValue(value, p), name, shorthand, usage)
++}
++
++// UintSlice defines a []uint flag with specified name, default value, and usage string.
++// The return value is the address of a []uint variable that stores the value of the flag.
++func (f *FlagSet) UintSlice(name string, value []uint, usage string) *[]uint {
++	p := []uint{}
++	f.UintSliceVarP(&p, name, "", value, usage)
++	return &p
++}
++
++// UintSliceP is like UintSlice, but accepts a shorthand letter that can be used after a single dash.
++func (f *FlagSet) UintSliceP(name, shorthand string, value []uint, usage string) *[]uint {
++	p := []uint{}
++	f.UintSliceVarP(&p, name, shorthand, value, usage)
++	return &p
++}
++
++// UintSlice defines a []uint flag with specified name, default value, and usage string.
++// The return value is the address of a []uint variable that stores the value of the flag.
++func UintSlice(name string, value []uint, usage string) *[]uint {
++	return CommandLine.UintSliceP(name, "", value, usage)
++}
++
++// UintSliceP is like UintSlice, but accepts a shorthand letter that can be used after a single dash.
++func UintSliceP(name, shorthand string, value []uint, usage string) *[]uint {
++	return CommandLine.UintSliceP(name, shorthand, value, usage)
++}
+-- 
+2.19.2
+
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index c3dd536937..2624549298 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -6,7 +6,6 @@
 
 DOCKER_CLI_VERSION = v18.09.2
 DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
-DOCKER_CLI_WORKSPACE = gopath
 
 DOCKER_CLI_LICENSE = Apache-2.0
 DOCKER_CLI_LICENSE_FILES = LICENSE
@@ -14,7 +13,7 @@ DOCKER_CLI_LICENSE_FILES = LICENSE
 DOCKER_CLI_DEPENDENCIES = host-pkgconf
 
 DOCKER_CLI_TAGS = autogen
-DOCKER_CLI_BUILD_TARGETS = cmd/docker
+DOCKER_CLI_BUILD_TARGETS = github.com/docker/cli/cmd/docker
 
 DOCKER_CLI_LDFLAGS = \
 	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_CLI_VERSION) \
diff --git a/package/docker-cli/go.mod b/package/docker-cli/go.mod
new file mode 100644
index 0000000000..0d585ca894
--- /dev/null
+++ b/package/docker-cli/go.mod
@@ -0,0 +1,127 @@
+module github.com/docker/cli
+
+// v18.09.2
+replace github.com/docker/docker => github.com/docker/engine v0.0.0-20190206233949-eb137ff1765f
+
+// In-tree pflag fixup
+replace github.com/spf13/pflag => ./thirdparty/pflag
+
+// Derived from vendor.conf with go mod init
+require (
+	cloud.google.com/go v0.37.0 // indirect
+	github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78 // indirect
+	github.com/Jeffail/gabs v1.2.0 // indirect
+	github.com/Microsoft/go-winio v0.4.10 // indirect
+	github.com/Microsoft/hcsshim v0.0.0-20180822151309-44c060121b68 // indirect
+	github.com/Nvveen/Gotty v0.0.0-20120604004816-cd527374f1e5
+	github.com/Shopify/logrus-bugsnag v0.0.0-20171204204709-577dee27f20d // indirect
+	github.com/agl/ed25519 v0.0.0-20170116200512-5312a6153412 // indirect
+	github.com/asaskevich/govalidator v0.0.0-20180720115003-f9ffefc3facf // indirect
+	github.com/bitly/go-hostpool v0.0.0-20171023180738-a3a6125de932 // indirect
+	github.com/bitly/go-simplejson v0.5.0 // indirect
+	github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869 // indirect
+	github.com/boltdb/bolt v1.3.1 // indirect
+	github.com/bugsnag/bugsnag-go v1.4.0 // indirect
+	github.com/bugsnag/panicwrap v1.2.0 // indirect
+	github.com/cenkalti/backoff v2.1.1+incompatible // indirect
+	github.com/cloudflare/cfssl v0.0.0-20181213083726-b94e044bb51e // indirect
+	github.com/containerd/cgroups v0.0.0-20190226200435-dbea6f2bd416 // indirect
+	github.com/containerd/console v0.0.0-20180822173158-c12b1e7919c1
+	github.com/containerd/containerd v0.0.0-20180912143703-bb0f83ab6eec
+	github.com/containerd/continuity v0.0.0-20180216233310-d8fb8589b0e8 // indirect
+	github.com/containerd/fifo v0.0.0-20180307165137-3d5202aec260 // indirect
+	github.com/containerd/typeurl v0.0.0-20170912152501-f6943554a7e7 // indirect
+	github.com/coreos/go-systemd v0.0.0-20190212144455-93d5ec2c7f76 // indirect
+	github.com/cpuguy83/go-md2man v1.0.8
+	github.com/denisenkom/go-mssqldb v0.0.0-20190315220205-a8ed825ac853 // indirect
+	github.com/dgrijalva/jwt-go v2.6.0+incompatible // indirect
+	github.com/docker/distribution v0.0.0-20180327202408-83389a148052
+	github.com/docker/docker v0.0.0-00010101000000-000000000000
+	github.com/docker/docker-credential-helpers v0.6.1
+	github.com/docker/go v0.0.0-20160303222718-d30aec9fd63c // indirect
+	github.com/docker/go-connections v0.4.0
+	github.com/docker/go-events v0.0.0-20170721190031-9461782956ad // indirect
+	github.com/docker/go-metrics v0.0.0-20170502235133-d466d4f6fd96 // indirect
+	github.com/docker/go-units v0.3.3
+	github.com/docker/libtrust v0.0.0-20150526203908-9cbd2a1374f4 // indirect
+	github.com/docker/licensing v0.0.0-20181018214158-1c117a1720cb
+	github.com/docker/swarmkit v0.0.0-20180820032850-cfa742c8abe6
+	github.com/erikstmartin/go-testdb v0.0.0-20160219214506-8d10e4a1bae5 // indirect
+	github.com/flynn-archive/go-shlex v0.0.0-20150515145356-3f9db97f8568
+	github.com/go-sql-driver/mysql v1.4.1 // indirect
+	github.com/godbus/dbus v4.1.0+incompatible // indirect
+	github.com/gofrs/uuid v3.2.0+incompatible // indirect
+	github.com/gogo/googleapis v0.0.0-20180501115203-b23578765ee5 // indirect
+	github.com/gogo/protobuf v1.1.1
+	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
+	github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef // indirect
+	github.com/google/certificate-transparency-go v1.0.21 // indirect
+	github.com/google/go-cmp v0.2.0
+	github.com/google/gofuzz v0.0.0-20170612174753-24818f796faf // indirect
+	github.com/google/shlex v0.0.0-20150127133951-6f45313302b9 // indirect
+	github.com/googleapis/gnostic v0.2.0 // indirect
+	github.com/gorilla/context v1.1.1 // indirect
+	github.com/gorilla/mux v1.6.2 // indirect
+	github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0 // indirect
+	github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645 // indirect
+	github.com/hailocab/go-hostpool v0.0.0-20160125115350-e80d13ce29ed // indirect
+	github.com/hashicorp/go-version v0.0.0-20180322230233-23480c066577
+	github.com/hashicorp/golang-lru v0.0.0-20180201235237-0fb14efe8c47 // indirect
+	github.com/imdario/mergo v0.3.6
+	github.com/inconshreveable/mousetrap v1.0.0 // indirect
+	github.com/jinzhu/gorm v1.9.2 // indirect
+	github.com/jinzhu/inflection v0.0.0-20180308033659-04140366298a // indirect
+	github.com/jinzhu/now v1.0.0 // indirect
+	github.com/json-iterator/go v0.0.0-20180701071628-ab8a2e0c74be // indirect
+	github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0 // indirect
+	github.com/lib/pq v1.0.0 // indirect
+	github.com/mattn/go-shellwords v1.0.3
+	github.com/mattn/go-sqlite3 v1.10.0 // indirect
+	github.com/miekg/pkcs11 v0.0.0-20180425180052-287d9350987c // indirect
+	github.com/mitchellh/mapstructure v1.1.2
+	github.com/moby/buildkit v0.0.0-20181005022200-520201006c9d
+	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
+	github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742 // indirect
+	github.com/morikuni/aec v0.0.0-20170113033406-39771216ff4c
+	github.com/onsi/ginkgo v1.8.0 // indirect
+	github.com/onsi/gomega v1.5.0 // indirect
+	github.com/opencontainers/go-digest v1.0.0-rc1
+	github.com/opencontainers/image-spec v1.0.1
+	github.com/opencontainers/runc v0.0.0-20180815054256-20aff4f0488c // indirect
+	github.com/opencontainers/runtime-spec v1.0.1
+	github.com/opentracing/opentracing-go v0.0.0-20171003133519-1361b9cd60be // indirect
+	github.com/peterbourgon/diskv v2.0.1+incompatible // indirect
+	github.com/pkg/errors v0.0.0-20161002052512-839d9e913e06
+	github.com/satori/go.uuid v0.0.0-20151028231719-d41af8bb6a77 // indirect
+	github.com/sirupsen/logrus v1.0.6
+	github.com/spf13/cobra v0.0.3
+	github.com/spf13/pflag v1.0.4-0.20181223182923-24fa6976df40
+	github.com/spf13/viper v1.3.2 // indirect
+	github.com/stretchr/testify v1.3.0 // indirect
+	github.com/syndtr/gocapability v0.0.0-20150716010906-2c00daeb6c3b // indirect
+	github.com/theupdateframework/notary v0.6.1
+	github.com/tonistiigi/fsutil v0.0.0-20181002165410-f567071bed24
+	github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea // indirect
+	github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f // indirect
+	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
+	github.com/xeipuuv/gojsonschema v0.0.0-20160323030313-93e72a773fad
+	github.com/xlab/handysort v0.0.0-20150421192137-fb3537ed64a1 // indirect
+	golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9
+	golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6
+	golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a
+	golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2
+	golang.org/x/time v0.0.0-20181108054448-85acf8d2951c
+	gopkg.in/airbrake/gobrake.v2 v2.0.9 // indirect
+	gopkg.in/dancannon/gorethink.v3 v3.0.5 // indirect
+	gopkg.in/fatih/pool.v2 v2.0.0 // indirect
+	gopkg.in/gemnasium/logrus-airbrake-hook.v2 v2.1.2 // indirect
+	gopkg.in/gorethink/gorethink.v3 v3.0.5 // indirect
+	gopkg.in/yaml.v2 v2.2.2
+	gotest.tools v2.1.0+incompatible
+	k8s.io/api v0.0.0-20180712090710-2d6f90ab1293
+	k8s.io/apimachinery v0.0.0-20180621070125-103fd098999d
+	k8s.io/client-go v0.0.0-20180806134042-1f13a808da65
+	k8s.io/kube-openapi v0.0.0-20180719232738-d8ea2fe547a4 // indirect
+	k8s.io/kubernetes v1.11.2
+	vbom.ml/util v0.0.0-20170409195630-256737ac55c4
+)
diff --git a/package/docker-cli/go.sum b/package/docker-cli/go.sum
new file mode 100644
index 0000000000..5e80f04643
--- /dev/null
+++ b/package/docker-cli/go.sum
@@ -0,0 +1,419 @@
+cloud.google.com/go v0.26.0/go.mod h1:aQUYkXzVsufM+DwF1aE+0xfcU+56JwCaLick0ClmMTw=
+cloud.google.com/go v0.31.0/go.mod h1:aQUYkXzVsufM+DwF1aE+0xfcU+56JwCaLick0ClmMTw=
+cloud.google.com/go v0.37.0 h1:69FNAINiZfsEuwH3fKq8QrAAnHz+2m4XL4kVYi5BX0Q=
+cloud.google.com/go v0.37.0/go.mod h1:TS1dMSSfndXH133OKGwekG838Om/cQT0BUHV3HcBgoo=
+dmitri.shuralyov.com/app/changes v0.0.0-20180602232624-0a106ad413e3/go.mod h1:Yl+fi1br7+Rr3LqpNJf1/uxUdtRUV+Tnj0o93V2B9MU=
+dmitri.shuralyov.com/html/belt v0.0.0-20180602232347-f7d459c86be0/go.mod h1:JLBrvjyP0v+ecvNYvCpyZgu5/xkfAUhi6wJj28eUfSU=
+dmitri.shuralyov.com/service/change v0.0.0-20181023043359-a85b471d5412/go.mod h1:a1inKt/atXimZ4Mv927x+r7UpyzRUf4emIoiiSC2TN4=
+dmitri.shuralyov.com/state v0.0.0-20180228185332-28bcc343414c/go.mod h1:0PRwlb0D6DFvNNtx+9ybjezNCa8XF0xaYcETyp6rHWU=
+git.apache.org/thrift.git v0.0.0-20180902110319-2566ecd5d999/go.mod h1:fPE2ZNJGynbRyZ4dJvy6G277gSllfV2HJqblrnkyeyg=
+github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78 h1:w+iIsaOQNcT7OZ575w+acHgRric5iCyQh+xv+KJ4HB8=
+github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78/go.mod h1:LmzpDX56iTiv29bbRTIsUNlaFfuhWRQBWjQdVyAevI8=
+github.com/BurntSushi/toml v0.3.1 h1:WXkYYl6Yr3qBf1K79EBnL4mak0OimBfB0XUf9Vl28OQ=
+github.com/BurntSushi/toml v0.3.1/go.mod h1:xHWCNGjB5oqiDr8zfno3MHue2Ht5sIBksp03qcyfWMU=
+github.com/Jeffail/gabs v1.2.0 h1:uFhoIVTtsX7hV2RxNgWad8gMU+8OJdzFbOathJdhD3o=
+github.com/Jeffail/gabs v1.2.0/go.mod h1:6xMvQMK4k33lb7GUUpaAPh6nKMmemQeg5d4gn7/bOXc=
+github.com/Microsoft/go-winio v0.4.10 h1:NrhPZI+cp3Fjmm5t/PZkVuir43JIRLZG/PSKK7atSfw=
+github.com/Microsoft/go-winio v0.4.10/go.mod h1:VhR8bwka0BXejwEJY73c50VrPtXAaKcyvVC4A4RozmA=
+github.com/Microsoft/hcsshim v0.0.0-20180822151309-44c060121b68 h1:Ql7fiqPfA1qtyv+herh2EwrWoPfbxBczLFTRMRywFEg=
+github.com/Microsoft/hcsshim v0.0.0-20180822151309-44c060121b68/go.mod h1:Op3hHsoHPAvb6lceZHDtd9OkTew38wNoXnJs8iY7rUg=
+github.com/Nvveen/Gotty v0.0.0-20170406111628-a8b993ba6abd h1:zxGnnE1K701Osh7fbn1bvr8DIts63ihxk3ppwvGkLyA=
+github.com/Nvveen/Gotty v0.0.0-20170406111628-a8b993ba6abd/go.mod h1:lmUJ/7eu/Q8D7ML55dXQrVaamCz2vxCfdQBasLZfHKk=
+github.com/Shopify/logrus-bugsnag v0.0.0-20171204204709-577dee27f20d h1:UrqY+r/OJnIp5u0s1SbQ8dVfLCZJsnvazdBP5hS4iRs=
+github.com/Shopify/logrus-bugsnag v0.0.0-20171204204709-577dee27f20d/go.mod h1:HI8ITrYtUY+O+ZhtlqUnD8+KwNPOyugEhfP9fdUIaEQ=
+github.com/agl/ed25519 v0.0.0-20170116200512-5312a6153412 h1:w1UutsfOrms1J05zt7ISrnJIXKzwaspym5BTKGx93EI=
+github.com/agl/ed25519 v0.0.0-20170116200512-5312a6153412/go.mod h1:WPjqKcmVOxf0XSf3YxCJs6N6AOSrOx3obionmG7T0y0=
+github.com/anmitsu/go-shlex v0.0.0-20161002113705-648efa622239/go.mod h1:2FmKhYUyUczH0OGQWaF5ceTx0UBShxjsH6f8oGKYe2c=
+github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod h1:grANhF5doyWs3UAsr3K4I6qtAmlQcZDesFNEHPZAzj8=
+github.com/asaskevich/govalidator v0.0.0-20180720115003-f9ffefc3facf h1:eg0MeVzsP1G42dRafH3vf+al2vQIJU0YHX+1Tw87oco=
+github.com/asaskevich/govalidator v0.0.0-20180720115003-f9ffefc3facf/go.mod h1:lB+ZfQJz7igIIfQNfa7Ml4HSf2uFQQRzpGGRXenZAgY=
+github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973 h1:xJ4a3vCFaGF/jqvzLMYoU8P317H5OQ+Via4RmuPwCS0=
+github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod h1:Dwedo/Wpr24TaqPxmxbtue+5NUziq4I4S80YR8gNf3Q=
+github.com/bitly/go-hostpool v0.0.0-20171023180738-a3a6125de932 h1:mXoPYz/Ul5HYEDvkta6I8/rnYM5gSdSV2tJ6XbZuEtY=
+github.com/bitly/go-hostpool v0.0.0-20171023180738-a3a6125de932/go.mod h1:NOuUCSz6Q9T7+igc/hlvDOUdtWKryOrtFyIVABv/p7k=
+github.com/bitly/go-simplejson v0.5.0 h1:6IH+V8/tVMab511d5bn4M7EwGXZf9Hj6i2xSwkNEM+Y=
+github.com/bitly/go-simplejson v0.5.0/go.mod h1:cXHtHw4XUPsvGaxgjIAn8PhEWG9NfngEKAMDJEczWVA=
+github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869 h1:DDGfHa7BWjL4YnC6+E63dPcxHo2sUxDIu8g3QgEJdRY=
+github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869/go.mod h1:Ekp36dRnpXw/yCqJaO+ZrUyxD+3VXMFFr56k5XYrpB4=
+github.com/boltdb/bolt v1.3.1 h1:JQmyP4ZBrce+ZQu0dY660FMfatumYDLun9hBCUVIkF4=
+github.com/boltdb/bolt v1.3.1/go.mod h1:clJnj/oiGkjum5o1McbSZDSLxVThjynRyGBgiAx27Ps=
+github.com/bradfitz/go-smtpd v0.0.0-20170404230938-deb6d6237625/go.mod h1:HYsPBTaaSFSlLx/70C2HPIMNZpVV8+vt/A+FMnYP11g=
+github.com/bugsnag/bugsnag-go v1.4.0 h1:CLCt5wO6/P0GelBEMRrlF52XveQMnnXHoCoxGZ+8a5g=
+github.com/bugsnag/bugsnag-go v1.4.0/go.mod h1:2oa8nejYd4cQ/b0hMIopN0lCRxU0bueqREvZLWFrtK8=
+github.com/bugsnag/panicwrap v1.2.0 h1:OzrKrRvXis8qEvOkfcxNcYbOd2O7xXS2nnKMEMABFQA=
+github.com/bugsnag/panicwrap v1.2.0/go.mod h1:D/8v3kj0zr8ZAKg1AQ6crr+5VwKN5eIywRkfhyM/+dE=
+github.com/cenkalti/backoff v2.1.1+incompatible h1:tKJnvO2kl0zmb/jA5UKAt4VoEVw1qxKWjE/Bpp46npY=
+github.com/cenkalti/backoff v2.1.1+incompatible/go.mod h1:90ReRw6GdpyfrHakVjL/QHaoyV4aDUVVkXQJJJ3NXXM=
+github.com/client9/misspell v0.3.4/go.mod h1:qj6jICC3Q7zFZvVWo7KLAzC3yx5G7kyvSDkc90ppPyw=
+github.com/cloudflare/cfssl v0.0.0-20181213083726-b94e044bb51e h1:Qux+lbuMaRzkQyTdzgtz8MgzPtzmaPQy6DXmxpdxT3U=
+github.com/cloudflare/cfssl v0.0.0-20181213083726-b94e044bb51e/go.mod h1:yMWuSON2oQp+43nFtAV/uvKQIFpSPerB57DCt9t8sSA=
+github.com/containerd/cgroups v0.0.0-20190226200435-dbea6f2bd416 h1:AaSMvkPaxfZD/OsDVBueAKzY5lnWAqLWgUivNg37WHA=
+github.com/containerd/cgroups v0.0.0-20190226200435-dbea6f2bd416/go.mod h1:X9rLEHIqSf/wfK8NsPqxJmeZgW4pcfzdXITDrUSJ6uI=
+github.com/containerd/console v0.0.0-20180822173158-c12b1e7919c1 h1:uict5mhHFTzKLUCufdSLym7z/J0CbBJT59lYbP9wtbg=
+github.com/containerd/console v0.0.0-20180822173158-c12b1e7919c1/go.mod h1:Tj/on1eG8kiEhd0+fhSDzsPAFESxzBBvdyEgyryXffw=
+github.com/containerd/containerd v0.0.0-20180912143703-bb0f83ab6eec h1:J3elAHUiHxWEccjiGlbF2LZKhcnAHL70NeX0PF7mK4s=
+github.com/containerd/containerd v0.0.0-20180912143703-bb0f83ab6eec/go.mod h1:bC6axHOhabU15QhwfG7w5PipXdVtMXFTttgp+kVtyUA=
+github.com/containerd/continuity v0.0.0-20180216233310-d8fb8589b0e8 h1:ZZOFPzvZO3N0f4LIQvZi68F2XDAMl/gqBfFMVjY6B3Y=
+github.com/containerd/continuity v0.0.0-20180216233310-d8fb8589b0e8/go.mod h1:GL3xCUCBDV3CZiTSEKksMWbLE66hEyuu9qyDOOqM47Y=
+github.com/containerd/fifo v0.0.0-20180307165137-3d5202aec260 h1:XGyg7oTtD0DoRFhbpV6x1WfV0flKC4UxXU7ab1zC08U=
+github.com/containerd/fifo v0.0.0-20180307165137-3d5202aec260/go.mod h1:ODA38xgv3Kuk8dQz2ZQXpnv/UZZUHUCL7pnLehbXgQI=
+github.com/containerd/typeurl v0.0.0-20170912152501-f6943554a7e7 h1:YLPsBBeWkiuDaXl6yV5sJI4PUo6JU3AKPfxtl/Xuukg=
+github.com/containerd/typeurl v0.0.0-20170912152501-f6943554a7e7/go.mod h1:Cm3kwCdlkCfMSHURc+r6fwoGH6/F1hH3S4sg0rLFWPc=
+github.com/coreos/etcd v3.3.10+incompatible h1:jFneRYjIvLMLhDLCzuTuU4rSJUjRplcJQ7pD7MnhC04=
+github.com/coreos/etcd v3.3.10+incompatible/go.mod h1:uF7uidLiAD3TWHmW31ZFd/JWoc32PjwdhPthX9715RE=
+github.com/coreos/go-etcd v2.0.0+incompatible/go.mod h1:Jez6KQU2B/sWsbdaef3ED8NzMklzPG4d5KIOhIy30Tk=
+github.com/coreos/go-semver v0.2.0/go.mod h1:nnelYz7RCh+5ahJtPPxZlU+153eP4D4r3EedlOD2RNk=
+github.com/coreos/go-systemd v0.0.0-20181012123002-c6f51f82210d/go.mod h1:F5haX7vjVVG0kc13fIWeqUViNPyEJxv/OmvnBo0Yme4=
+github.com/coreos/go-systemd v0.0.0-20190212144455-93d5ec2c7f76 h1:FE783w8WFh+Rvg+7bZ5g8p7gP4SeVS4AoNwkvazlsBg=
+github.com/coreos/go-systemd v0.0.0-20190212144455-93d5ec2c7f76/go.mod h1:F5haX7vjVVG0kc13fIWeqUViNPyEJxv/OmvnBo0Yme4=
+github.com/cpuguy83/go-md2man v1.0.8 h1:DwoNytLphI8hzS2Af4D0dfaEaiSq2bN05mEm4R6vf8M=
+github.com/cpuguy83/go-md2man v1.0.8/go.mod h1:N6JayAiVKtlHSnuTCeuLSQVs75hb8q+dYQLjr7cDsKY=
+github.com/davecgh/go-spew v1.1.0 h1:ZDRjVQ15GmhC3fiQ8ni8+OwkZQO4DARzQgrnXU1Liz8=
+github.com/davecgh/go-spew v1.1.0/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
+github.com/davecgh/go-spew v1.1.1 h1:vj9j/u1bqnvCEfJOwUhtlOARqs3+rkHYY13jYWTU97c=
+github.com/davecgh/go-spew v1.1.1/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
+github.com/denisenkom/go-mssqldb v0.0.0-20190315220205-a8ed825ac853 h1:tTngnoO/B6HQnJ+pK8tN7kEAhmhIfaJOutqq/A4/JTM=
+github.com/denisenkom/go-mssqldb v0.0.0-20190315220205-a8ed825ac853/go.mod h1:xN/JuLBIz4bjkxNmByTiV1IbhfnYb6oo99phBn4Eqhc=
+github.com/dgrijalva/jwt-go v2.6.0+incompatible h1:1O2NahKrpPnTN8Jy7ffR7S31wnTZIM4PEzrF8br1R4g=
+github.com/dgrijalva/jwt-go v2.6.0+incompatible/go.mod h1:E3ru+11k8xSBh+hMPgOLZmtrrCbhqsmaPHjLKYnJCaQ=
+github.com/docker/distribution v0.0.0-20180327202408-83389a148052 h1:bYklS+YB8BZreSEY+/WqaH+S8upfuYf0Hq/EmNOQMIA=
+github.com/docker/distribution v0.0.0-20180327202408-83389a148052/go.mod h1:J2gT2udsDAN96Uj4KfcMRqY0/ypR+oyYUYmja8H+y+w=
+github.com/docker/docker-credential-helpers v0.6.1 h1:Dq4iIfcM7cNtddhLVWe9h4QDjsi4OER3Z8voPu/I52g=
+github.com/docker/docker-credential-helpers v0.6.1/go.mod h1:WRaJzqw3CTB9bk10avuGsjVBZsD05qeibJ1/TYlvc0Y=
+github.com/docker/engine v0.0.0-20190206233949-eb137ff1765f h1:syROiDcQNWAcDNPfq3dkPdnMYeomRmIGR1sGsYKLGN8=
+github.com/docker/engine v0.0.0-20190206233949-eb137ff1765f/go.mod h1:3CPr2caMgTHxxIAZgEMd3uLYPDlRvPqCpyeRf6ncPcY=
+github.com/docker/go v0.0.0-20160303222718-d30aec9fd63c h1:Ggg7IiOtghyZzn3ozi31kPHpV6qSjMgmesXaWCijYNM=
+github.com/docker/go v0.0.0-20160303222718-d30aec9fd63c/go.mod h1:CADgU4DSXK5QUlFslkQu2yW2TKzFZcXq/leZfM0UH5Q=
+github.com/docker/go-connections v0.4.0 h1:El9xVISelRB7BuFusrZozjnkIM5YnzCViNKohAFqRJQ=
+github.com/docker/go-connections v0.4.0/go.mod h1:Gbd7IOopHjR8Iph03tsViu4nIes5XhDvyHbTtUxmeec=
+github.com/docker/go-events v0.0.0-20170721190031-9461782956ad h1:VXIse57M5C6ezDuCPyq6QmMvEJ2xclYKZ35SfkXdm3E=
+github.com/docker/go-events v0.0.0-20170721190031-9461782956ad/go.mod h1:Uw6UezgYA44ePAFQYUehOuCzmy5zmg/+nl2ZfMWGkpA=
+github.com/docker/go-metrics v0.0.0-20170502235133-d466d4f6fd96 h1:HVQ/BC7Ze+bcVle903SvZMvncOcG2y3zI2K7i3jEHSM=
+github.com/docker/go-metrics v0.0.0-20170502235133-d466d4f6fd96/go.mod h1:/u0gXw0Gay3ceNrsHubL3BtdOL2fHf93USgMTe0W5dI=
+github.com/docker/go-units v0.3.3 h1:Xk8S3Xj5sLGlG5g67hJmYMmUgXv5N4PhkjJHHqrwnTk=
+github.com/docker/go-units v0.3.3/go.mod h1:fgPhTUdO+D/Jk86RDLlptpiXQzgHJF7gydDDbaIK4Dk=
+github.com/docker/libtrust v0.0.0-20150526203908-9cbd2a1374f4 h1:k8TfKGeAcDQFFQOGCQMRN04N4a9YrPlRMMKnzAuvM9Q=
+github.com/docker/libtrust v0.0.0-20150526203908-9cbd2a1374f4/go.mod h1:cyGadeNEkKy96OOhEzfZl+yxihPEzKnqJwvfuSUqbZE=
+github.com/docker/licensing v0.0.0-20181018214158-1c117a1720cb h1:NbYsGDdef5DGBdT1YqtidriMgyJYc9nJi2rjqiGp+6w=
+github.com/docker/licensing v0.0.0-20181018214158-1c117a1720cb/go.mod h1:i6G9MMvTx3Dnr7TKD2OK5NYLQVoah2cRVKTnd1SbaGM=
+github.com/docker/swarmkit v0.0.0-20180820032850-cfa742c8abe6 h1:LPgH2mOqF8mBFTqMMR7fT7h6pVd4mC+loYyBoeYy+rM=
+github.com/docker/swarmkit v0.0.0-20180820032850-cfa742c8abe6/go.mod h1:n3Z4lIEl7g261ptkGDBcYi/3qBMDl9csaAhwi2MPejs=
+github.com/dustin/go-humanize v1.0.0/go.mod h1:HtrtbFcZ19U5GC7JDqmcUSB87Iq5E25KnS6fMYU6eOk=
+github.com/erikstmartin/go-testdb v0.0.0-20160219214506-8d10e4a1bae5 h1:Yzb9+7DPaBjB8zlTR87/ElzFsnQfuHnVUVqpZZIcV5Y=
+github.com/erikstmartin/go-testdb v0.0.0-20160219214506-8d10e4a1bae5/go.mod h1:a2zkGnVExMxdzMo3M0Hi/3sEU+cWnZpSni0O6/Yb/P0=
+github.com/flynn-archive/go-shlex v0.0.0-20150515145356-3f9db97f8568 h1:BMXYYRWTLOJKlh+lOBt6nUQgXAfB7oVIQt5cNreqSLI=
+github.com/flynn-archive/go-shlex v0.0.0-20150515145356-3f9db97f8568/go.mod h1:rZfgFAXFS/z/lEd6LJmf9HVZ1LkgYiHx5pHhV5DR16M=
+github.com/flynn/go-shlex v0.0.0-20150515145356-3f9db97f8568/go.mod h1:xEzjJPgXI435gkrCt3MPfRiAkVrwSbHsst4LCFVfpJc=
+github.com/fsnotify/fsnotify v1.4.7 h1:IXs+QLmnXW2CcXuY+8Mzv/fWEsPGWxqefPtCP5CnV9I=
+github.com/fsnotify/fsnotify v1.4.7/go.mod h1:jwhsz4b93w/PPRr/qN1Yymfu8t87LnFCMoQvtojpjFo=
+github.com/ghodss/yaml v1.0.0 h1:wQHKEahhL6wmXdzwWG11gIVCkOv05bNOh+Rxn0yngAk=
+github.com/ghodss/yaml v1.0.0/go.mod h1:4dBDuWmgqj2HViK6kFavaiC9ZROes6MMH2rRYeMEF04=
+github.com/gliderlabs/ssh v0.1.1/go.mod h1:U7qILu1NlMHj9FlMhZLlkCdDnU1DBEAqr0aevW3Awn0=
+github.com/go-sql-driver/mysql v1.4.1 h1:g24URVg0OFbNUTx9qqY1IRZ9D9z3iPyi5zKhQZpNwpA=
+github.com/go-sql-driver/mysql v1.4.1/go.mod h1:zAC/RDZ24gD3HViQzih4MyKcchzm+sOG5ZlKdlhCg5w=
+github.com/godbus/dbus v4.1.0+incompatible h1:WqqLRTsQic3apZUK9qC5sGNfXthmPXzUZ7nQPrNITa4=
+github.com/godbus/dbus v4.1.0+incompatible/go.mod h1:/YcGZj5zSblfDWMMoOzV4fas9FZnQYTkDnsGvmh2Grw=
+github.com/gofrs/uuid v3.2.0+incompatible h1:y12jRkkFxsd7GpqdSZ+/KCs/fJbqpEXSGd4+jfEaewE=
+github.com/gofrs/uuid v3.2.0+incompatible/go.mod h1:b2aQJv3Z4Fp6yNu3cdSllBxTCLRxnplIgP/c0N/04lM=
+github.com/gogo/googleapis v0.0.0-20180501115203-b23578765ee5 h1:/IG8HCSoBr+VsVJYoJ+gf91i8ZX2JuLOqd4t9Wt9zN4=
+github.com/gogo/googleapis v0.0.0-20180501115203-b23578765ee5/go.mod h1:gf4bu3Q80BeJ6H1S1vYPm8/ELATdvryBaNFGgqEef3s=
+github.com/gogo/protobuf v1.1.1 h1:72R+M5VuhED/KujmZVcIquuo8mBgX4oVda//DQb3PXo=
+github.com/gogo/protobuf v1.1.1/go.mod h1:r8qH/GZQm5c6nD/R0oafs1akxWv10x8SbQlK7atdtwQ=
+github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b h1:VKtxabqXZkF25pY9ekfRL6a582T4P37/31XEstQ5p58=
+github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod h1:SBH7ygxi8pfUlaOkMMuAQtPIUF8ecWP5IEl/CR7VP2Q=
+github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef h1:veQD95Isof8w9/WXiA+pa3tz3fJXkt5B7QaRBrM62gk=
+github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef/go.mod h1:cIg4eruTrX1D+g88fzRXU5OdNfaM+9IcxsU14FzY7Hc=
+github.com/golang/lint v0.0.0-20180702182130-06c8688daad7/go.mod h1:tluoj9z5200jBnyusfRPU2LqT6J+DAorxEvtC7LHB+E=
+github.com/golang/mock v1.1.1/go.mod h1:oTYuIxOrZwtPieC+H1uAHpcLFnEyAGVDL/k47Jfbm0A=
+github.com/golang/mock v1.2.0/go.mod h1:oTYuIxOrZwtPieC+H1uAHpcLFnEyAGVDL/k47Jfbm0A=
+github.com/golang/protobuf v1.2.0 h1:P3YflyNX/ehuJFLhxviNdFxQPkGK5cDcApsge1SqnvM=
+github.com/golang/protobuf v1.2.0/go.mod h1:6lQm79b+lXiMfvg/cZm0SGofjICqVBUtrP5yJMmIC1U=
+github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c h1:964Od4U6p2jUkFxvCydnIczKteheJEzHRToSGK3Bnlw=
+github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod h1:lNA+9X1NB3Zf8V7Ke586lFgjr2dZNuvo3lPJSGZ5JPQ=
+github.com/google/certificate-transparency-go v1.0.21 h1:Yf1aXowfZ2nuboBsg7iYGLmwsOARdV86pfH3g95wXmE=
+github.com/google/certificate-transparency-go v1.0.21/go.mod h1:QeJfpSbVSfYc7RgB3gJFj9cbuQMMchQxrWXz8Ruopmg=
+github.com/google/go-cmp v0.2.0 h1:+dTQ8DZQJz0Mb/HjFlkptS1FeQ4cWSnN941F8aEG4SQ=
+github.com/google/go-cmp v0.2.0/go.mod h1:oXzfMopK8JAjlY9xF4vHSVASa0yLyX7SntLO5aqRK0M=
+github.com/google/go-github v17.0.0+incompatible/go.mod h1:zLgOLi98H3fifZn+44m+umXrS52loVEgC2AApnigrVQ=
+github.com/google/go-querystring v1.0.0/go.mod h1:odCYkC5MyYFN7vkCjXpyrEuKhc/BUO6wN/zVPAxq5ck=
+github.com/google/gofuzz v0.0.0-20170612174753-24818f796faf h1:+RRA9JqSOZFfKrOeqr2z77+8R2RKyh8PG66dcu1V0ck=
+github.com/google/gofuzz v0.0.0-20170612174753-24818f796faf/go.mod h1:HP5RmnzzSNb993RKQDq4+1A4ia9nllfqcQFTQJedwGI=
+github.com/google/martian v2.1.0+incompatible/go.mod h1:9I4somxYTbIHy5NJKHRl3wXiIaQGbYVAs8BPL6v8lEs=
+github.com/google/pprof v0.0.0-20181206194817-3ea8567a2e57/go.mod h1:zfwlbNMJ+OItoe0UupaVj+oy1omPYYDuagoSzA8v9mc=
+github.com/google/shlex v0.0.0-20150127133951-6f45313302b9 h1:JM174NTeGNJ2m/oLH3UOWOvWQQKd+BoL3hcSCUWFLt0=
+github.com/google/shlex v0.0.0-20150127133951-6f45313302b9/go.mod h1:RpwtwJQFrIEPstU94h88MWPXP2ektJZ8cZ0YntAmXiE=
+github.com/googleapis/gax-go v2.0.0+incompatible/go.mod h1:SFVmujtThgffbyetf+mdk2eWhX2bMyUtNHzFKcPA9HY=
+github.com/googleapis/gax-go/v2 v2.0.3/go.mod h1:LLvjysVCY1JZeum8Z6l8qUty8fiNwE08qbEPm1M08qg=
+github.com/googleapis/gnostic v0.2.0 h1:l6N3VoaVzTncYYW+9yOz2LJJammFZGBO13sqgEhpy9g=
+github.com/googleapis/gnostic v0.2.0/go.mod h1:sJBsCZ4ayReDTBIg8b9dl28c5xFWyhBTVRp3pOg5EKY=
+github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod h1:wJfORRmW1u3UXTncJ5qlYoELFm8eSnnEO6hX4iZ3EWY=
+github.com/gorilla/context v1.1.1 h1:AWwleXJkX/nhcU9bZSnZoi3h/qGYqQAGhq6zZe/aQW8=
+github.com/gorilla/context v1.1.1/go.mod h1:kBGZzfjB9CEq2AlWe17Uuf7NDRt0dE0s8S51q0aT7Yg=
+github.com/gorilla/mux v1.6.2 h1:Pgr17XVTNXAk3q/r4CpKzC5xBM/qW1uVLV+IhRZpIIk=
+github.com/gorilla/mux v1.6.2/go.mod h1:1lud6UwP+6orDFRuTfBEV8e9/aOM/c4fVVCaMa2zaAs=
+github.com/gregjones/httpcache v0.0.0-20180305231024-9cad4c3443a7 h1:pdN6V1QBWetyv/0+wjACpqVH+eVULgEjkurDLq3goeM=
+github.com/gregjones/httpcache v0.0.0-20180305231024-9cad4c3443a7/go.mod h1:FecbI9+v66THATjSRHfNgh1IVFe/9kFxbXtjV0ctIMA=
+github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0 h1:Ovs26xHkKqVztRpIrF/92BcuyuQ/YW4NSIpoGtfXNho=
+github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0/go.mod h1:8NvIoxWQoOIhqOTXgfV/d3M/q6VIi02HzZEHgUlZvzk=
+github.com/grpc-ecosystem/grpc-gateway v1.5.0/go.mod h1:RSKVYQBd5MCa4OVpNdGskqpgL2+G+NZTnrVHpWWfpdw=
+github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645 h1:MJG/KsmcqMwFAkh8mTnAwhyKoB+sTAnY4CACC110tbU=
+github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645/go.mod h1:6iZfnjpejD4L/4DwD7NryNaJyCQdzwWwH2MWhCA90Kw=
+github.com/hailocab/go-hostpool v0.0.0-20160125115350-e80d13ce29ed h1:5upAirOpQc1Q53c0bnx2ufif5kANL7bfZWcc6VJWJd8=
+github.com/hailocab/go-hostpool v0.0.0-20160125115350-e80d13ce29ed/go.mod h1:tMWxXQ9wFIaZeTI9F+hmhFiGpFmhOHzyShyFUhRm0H4=
+github.com/hashicorp/go-version v0.0.0-20180322230233-23480c066577 h1:at4+18LrM8myamuV7/vT6x2s1JNXp2k4PsSbt4I02X4=
+github.com/hashicorp/go-version v0.0.0-20180322230233-23480c066577/go.mod h1:fltr4n8CU8Ke44wwGCBoEymUuxUHl09ZGVZPK5anwXA=
+github.com/hashicorp/golang-lru v0.0.0-20180201235237-0fb14efe8c47 h1:UnszMmmmm5vLwWzDjTFVIkfhvWF1NdrmChl8L2NUDCw=
+github.com/hashicorp/golang-lru v0.0.0-20180201235237-0fb14efe8c47/go.mod h1:/m3WP610KZHVQ1SGc6re/UDhFvYD7pJ4Ao+sR/qLZy8=
+github.com/hashicorp/hcl v1.0.0 h1:0Anlzjpi4vEasTeNFn2mLJgTSwt0+6sfsiTG8qcWGx4=
+github.com/hashicorp/hcl v1.0.0/go.mod h1:E5yfLk+7swimpb2L/Alb/PJmXilQ/rhwaUYs4T20WEQ=
+github.com/hpcloud/tail v1.0.0 h1:nfCOvKYfkgYP8hkirhJocXT2+zOD8yUNjXaWfTlyFKI=
+github.com/hpcloud/tail v1.0.0/go.mod h1:ab1qPbhIpdTxEkNHXyeSf5vhxWSCs/tWer42PpOxQnU=
+github.com/imdario/mergo v0.3.6 h1:xTNEAn+kxVO7dTZGu0CegyqKZmoWFI0rF8UxjlB2d28=
+github.com/imdario/mergo v0.3.6/go.mod h1:2EnlNZ0deacrJVfApfmtdGgDfMuh/nq6Ok1EcJh5FfA=
+github.com/inconshreveable/mousetrap v1.0.0 h1:Z8tu5sraLXCXIcARxBp/8cbvlwVa7Z1NHg9XEKhtSvM=
+github.com/inconshreveable/mousetrap v1.0.0/go.mod h1:PxqpIevigyE2G7u3NXJIT2ANytuPF1OarO4DADm73n8=
+github.com/jellevandenhooff/dkim v0.0.0-20150330215556-f50fe3d243e1/go.mod h1:E0B/fFc00Y+Rasa88328GlI/XbtyysCtTHZS8h7IrBU=
+github.com/jinzhu/gorm v1.9.2 h1:lCvgEaqe/HVE+tjAR2mt4HbbHAZsQOv3XAZiEZV37iw=
+github.com/jinzhu/gorm v1.9.2/go.mod h1:Vla75njaFJ8clLU1W44h34PjIkijhjHIYnZxMqCdxqo=
+github.com/jinzhu/inflection v0.0.0-20180308033659-04140366298a h1:eeaG9XMUvRBYXJi4pg1ZKM7nxc5AfXfojeLLW7O5J3k=
+github.com/jinzhu/inflection v0.0.0-20180308033659-04140366298a/go.mod h1:h+uFLlag+Qp1Va5pdKtLDYj+kHp5pxUVkryuEj+Srlc=
+github.com/jinzhu/now v1.0.0 h1:6WV8LvwPpDhKjo5U9O6b4+xdG/jTXNPwlDme/MTo8Ns=
+github.com/jinzhu/now v1.0.0/go.mod h1:oHTiXerJ20+SfYcrdlBO7rzZRJWGwSTQ0iUY2jI6Gfc=
+github.com/json-iterator/go v0.0.0-20180701071628-ab8a2e0c74be h1:AHimNtVIpiBjPUhEF5KNCkrUyqTSA5zWUl8sQ2bfGBE=
+github.com/json-iterator/go v0.0.0-20180701071628-ab8a2e0c74be/go.mod h1:+SdeFBvtyEkXs7REEP0seUULqWtbJapLOCVDaaPEHmU=
+github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod h1:6v2b51hI/fHJwM22ozAgKL4VKDeJcHhJFhtBdhmNjmU=
+github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0 h1:iQTw/8FWTuc7uiaSepXwyf3o52HaUYcV+Tu66S3F5GA=
+github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0/go.mod h1:1NbS8ALrpOvjt0rHPNLyCIeMtbizbir8U//inJ+zuB8=
+github.com/kisielk/gotool v1.0.0/go.mod h1:XhKaO+MFFWcvkIS/tQcRk01m1F5IRFswLeQ+oQHNcck=
+github.com/kr/pretty v0.1.0 h1:L/CwN0zerZDmRFUapSPitk6f+Q3+0za1rQkzVuMiMFI=
+github.com/kr/pretty v0.1.0/go.mod h1:dAy3ld7l9f0ibDNOQOHHMYYIIbhfbHSm3C4ZsoJORNo=
+github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
+github.com/kr/pty v1.1.3/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
+github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=
+github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI=
+github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=
+github.com/lib/pq v1.0.0/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIvNi/34Woo=
+github.com/magiconair/properties v1.8.0 h1:LLgXmsheXeRoUOBOjtwPQCWIYqM/LU1ayDtDePerRcY=
+github.com/magiconair/properties v1.8.0/go.mod h1:PppfXfuXeibc/6YijjN8zIbojt8czPbwD3XqdrwzmxQ=
+github.com/mattn/go-shellwords v1.0.3 h1:K/VxK7SZ+cvuPgFSLKi5QPI9Vr/ipOf4C1gN+ntueUk=
+github.com/mattn/go-shellwords v1.0.3/go.mod h1:3xCvwCdWdlDJUrvuMn7Wuy9eWs4pE8vqg+NOMyg4B2o=
+github.com/mattn/go-sqlite3 v1.10.0 h1:jbhqpg7tQe4SupckyijYiy0mJJ/pRyHvXf7JdWK860o=
+github.com/mattn/go-sqlite3 v1.10.0/go.mod h1:FPy6KqzDD04eiIsT53CuJW3U88zkxoIYsOqkbpncsNc=
+github.com/matttproud/golang_protobuf_extensions v1.0.1 h1:4hp9jkHxhMHkqkrB3Ix0jegS5sx/RkqARlsWZ6pIwiU=
+github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod h1:D8He9yQNgCq6Z5Ld7szi9bcBfOoFv/3dc6xSMkL2PC0=
+github.com/microcosm-cc/bluemonday v1.0.1/go.mod h1:hsXNsILzKxV+sX77C5b8FSuKF00vh2OMYv+xgHpAMF4=
+github.com/miekg/pkcs11 v0.0.0-20180425180052-287d9350987c h1:b4C1I45eTE1QpVdxxNcA4z/ZJphn+sSSzwrA/8ENUtI=
+github.com/miekg/pkcs11 v0.0.0-20180425180052-287d9350987c/go.mod h1:WCBAbTOdfhHhz7YXujeZMF7owC4tPb1naKFsgfUISjo=
+github.com/mitchellh/mapstructure v1.1.2 h1:fmNYVwqnSfB9mZU6OS2O6GsXM+wcskZDuKQzvN1EDeE=
+github.com/mitchellh/mapstructure v1.1.2/go.mod h1:FVVH3fgwuzCH5S8UJGiWEs2h04kUh9fWfEaFds41c1Y=
+github.com/moby/buildkit v0.0.0-20181005022200-520201006c9d h1:cCqSeLRIV7rhE2NaJzOJgXDnH9U6n3T1PxfcZ5JsJcM=
+github.com/moby/buildkit v0.0.0-20181005022200-520201006c9d/go.mod h1:nnELdKPRkUAQR6pAB3mRU3+IlbqL3SSaAWqQL8k/K+4=
+github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd h1:TRLaZ9cD/w8PVh93nsPXa1VrQ6jlwL5oN8l14QlcNfg=
+github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod h1:6dJC0mAP4ikYIbvyc7fijjWJddQyLn8Ig3JB5CqoB9Q=
+github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742 h1:Esafd1046DLDQ0W1YjYsBW+p8U2u7vzgW2SQVmlNazg=
+github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod h1:bx2lNnkwVCuqBIxFjflWJWanXIb3RllmbCylyMrvgv0=
+github.com/morikuni/aec v0.0.0-20170113033406-39771216ff4c h1:nXxl5PrvVm2L/wCy8dQu6DMTwH4oIuGN8GJDAlqDdVE=
+github.com/morikuni/aec v0.0.0-20170113033406-39771216ff4c/go.mod h1:BbKIizmSmc5MMPqRYbxO4ZU0S0+P200+tUnFx7PXmsc=
+github.com/neelance/astrewrite v0.0.0-20160511093645-99348263ae86/go.mod h1:kHJEU3ofeGjhHklVoIGuVj85JJwZ6kWPaJwCIxgnFmo=
+github.com/neelance/sourcemap v0.0.0-20151028013722-8c68805598ab/go.mod h1:Qr6/a/Q4r9LP1IltGz7tA7iOK1WonHEYhu1HRBA7ZiM=
+github.com/onsi/ginkgo v1.6.0/go.mod h1:lLunBs/Ym6LB5Z9jYTR76FiuTmxDTDusOGeTQH+WWjE=
+github.com/onsi/ginkgo v1.8.0 h1:VkHVNpR4iVnU8XQR6DBm8BqYjN7CRzw+xKUbVVbbW9w=
+github.com/onsi/ginkgo v1.8.0/go.mod h1:lLunBs/Ym6LB5Z9jYTR76FiuTmxDTDusOGeTQH+WWjE=
+github.com/onsi/gomega v1.5.0 h1:izbySO9zDPmjJ8rDjLvkA2zJHIo+HkYXHnf7eN7SSyo=
+github.com/onsi/gomega v1.5.0/go.mod h1:ex+gbHU/CVuBBDIJjb2X0qEXbFg53c61hWP/1CpauHY=
+github.com/opencontainers/go-digest v1.0.0-rc1 h1:WzifXhOVOEOuFYOJAW6aQqW0TooG2iki3E3Ii+WN7gQ=
+github.com/opencontainers/go-digest v1.0.0-rc1/go.mod h1:cMLVZDEM3+U2I4VmLI6N8jQYUd2OVphdqWwCJHrFt2s=
+github.com/opencontainers/image-spec v1.0.1 h1:JMemWkRwHx4Zj+fVxWoMCFm/8sYGGrUVojFA6h/TRcI=
+github.com/opencontainers/image-spec v1.0.1/go.mod h1:BtxoFyWECRxE4U/7sNtV5W15zMzWCbyJoFRP3s7yZA0=
+github.com/opencontainers/runc v0.0.0-20180815054256-20aff4f0488c h1:xCoeOUJ3kIT4+LU3Fkcg7Kt62cr1xq4fGLVuDvBDSYc=
+github.com/opencontainers/runc v0.0.0-20180815054256-20aff4f0488c/go.mod h1:qT5XzbpPznkRYVz/mWwUaVBUv2rmF59PVA73FjuZG0U=
+github.com/opencontainers/runtime-spec v1.0.1 h1:wY4pOY8fBdSIvs9+IDHC55thBuEulhzfSgKeC1yFvzQ=
+github.com/opencontainers/runtime-spec v1.0.1/go.mod h1:jwyrGlmzljRJv/Fgzds9SsS/C5hL+LL3ko9hs6T5lQ0=
+github.com/opentracing/opentracing-go v0.0.0-20171003133519-1361b9cd60be h1:vn0ruyYif1hUWDS2aEUdh6JGUfgK8gOOLpz/iTjb6pQ=
+github.com/opentracing/opentracing-go v0.0.0-20171003133519-1361b9cd60be/go.mod h1:UkNAQd3GIcIGf0SeVgPpRdFStlNbqXla1AfSYxPUl2o=
+github.com/openzipkin/zipkin-go v0.1.1/go.mod h1:NtoC/o8u3JlF1lSlyPNswIbeQH9bJTmOf0Erfk+hxe8=
+github.com/pelletier/go-toml v1.2.0 h1:T5zMGML61Wp+FlcbWjRDT7yAxhJNAiPPLOFECq181zc=
+github.com/pelletier/go-toml v1.2.0/go.mod h1:5z9KED0ma1S8pY6P1sdut58dfprrGBbd/94hg7ilaic=
+github.com/peterbourgon/diskv v2.0.1+incompatible h1:UBdAOUP5p4RWqPBg048CAvpKN+vxiaj6gdUUzhl4XmI=
+github.com/peterbourgon/diskv v2.0.1+incompatible/go.mod h1:uqqh8zWWbv1HBMNONnaR/tNboyR3/BZd58JJSHlUSCU=
+github.com/pkg/errors v0.0.0-20161002052512-839d9e913e06 h1:gKQKvMjnwDvwtZxyd2HDEDNNMRkjbPN1V89eOLqovSU=
+github.com/pkg/errors v0.0.0-20161002052512-839d9e913e06/go.mod h1:bwawxfHBFNV+L2hUp1rHADufV3IMtnDRdf1r5NINEl0=
+github.com/pmezard/go-difflib v1.0.0 h1:4DBwDE0NGyQoBHbLQYPwSUPoCMWR5BEzIk/f1lZbAQM=
+github.com/pmezard/go-difflib v1.0.0/go.mod h1:iKH77koFhYxTK1pcRnkKkqfTogsbg7gZNVY4sRDYZ/4=
+github.com/prometheus/client_golang v0.8.0 h1:1921Yw9Gc3iSc4VQh3PIoOqgPCZS7G/4xQNVUp8Mda8=
+github.com/prometheus/client_golang v0.8.0/go.mod h1:7SWBe2y4D6OKWSNQJUaRYU/AaXPKyh/dDVn+NZz0KFw=
+github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910 h1:idejC8f05m9MGOsuEi1ATq9shN03HrxNkD/luQvxCv8=
+github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod h1:MbSGuTsp3dbXC40dX6PRTWyKYBIrTGTE9sqQNg2J8bo=
+github.com/prometheus/common v0.0.0-20180801064454-c7de2306084e h1:n/3MEhJQjQxrOUCzh1Y3Re6aJUUWRp2M9+Oc3eVn/54=
+github.com/prometheus/common v0.0.0-20180801064454-c7de2306084e/go.mod h1:daVV7qP5qjZbuso7PdcryaAu0sAZbrN9i7WWcTMWvro=
+github.com/prometheus/procfs v0.0.0-20180725123919-05ee40e3a273 h1:agujYaXJSxSo18YNX3jzl+4G6Bstwt+kqv47GS12uL0=
+github.com/prometheus/procfs v0.0.0-20180725123919-05ee40e3a273/go.mod h1:c3At6R/oaqEKCNdg8wHV1ftS6bRYblBhIjjI8uT2IGk=
+github.com/russross/blackfriday v1.5.2 h1:HyvC0ARfnZBqnXwABFeSZHpKvJHJJfPz81GNueLj0oo=
+github.com/russross/blackfriday v1.5.2/go.mod h1:JO/DiYxRf+HjHt06OyowR9PTA263kcR/rfWxYHBV53g=
+github.com/satori/go.uuid v0.0.0-20151028231719-d41af8bb6a77 h1:X4eLA68fCmv+kFpUBFXIhv5wD5IFVB+oWUxjmpyl02c=
+github.com/satori/go.uuid v0.0.0-20151028231719-d41af8bb6a77/go.mod h1:dA0hQrYB0VpLJoorglMZABFdXlWrHn1NEOzdhQKdks0=
+github.com/sergi/go-diff v1.0.0/go.mod h1:0CfEIISq7TuYL3j771MWULgwwjU+GofnZX9QAmXWZgo=
+github.com/shurcooL/component v0.0.0-20170202220835-f88ec8f54cc4/go.mod h1:XhFIlyj5a1fBNx5aJTbKoIq0mNaPvOagO+HjB3EtxrY=
+github.com/shurcooL/events v0.0.0-20181021180414-410e4ca65f48/go.mod h1:5u70Mqkb5O5cxEA8nxTsgrgLehJeAw6Oc4Ab1c/P1HM=
+github.com/shurcooL/github_flavored_markdown v0.0.0-20181002035957-2122de532470/go.mod h1:2dOwnU2uBioM+SGy2aZoq1f/Sd1l9OkAeAUvjSyvgU0=
+github.com/shurcooL/go v0.0.0-20180423040247-9e1955d9fb6e/go.mod h1:TDJrrUr11Vxrven61rcy3hJMUqaf/CLWYhHNPmT14Lk=
+github.com/shurcooL/go-goon v0.0.0-20170922171312-37c2f522c041/go.mod h1:N5mDOmsrJOB+vfqUK+7DmDyjhSLIIBnXo9lvZJj3MWQ=
+github.com/shurcooL/gofontwoff v0.0.0-20180329035133-29b52fc0a18d/go.mod h1:05UtEgK5zq39gLST6uB0cf3NEHjETfB4Fgr3Gx5R9Vw=
+github.com/shurcooL/gopherjslib v0.0.0-20160914041154-feb6d3990c2c/go.mod h1:8d3azKNyqcHP1GaQE/c6dDgjkgSx2BZ4IoEi4F1reUI=
+github.com/shurcooL/highlight_diff v0.0.0-20170515013008-09bb4053de1b/go.mod h1:ZpfEhSmds4ytuByIcDnOLkTHGUI6KNqRNPDLHDk+mUU=
+github.com/shurcooL/highlight_go v0.0.0-20181028180052-98c3abbbae20/go.mod h1:UDKB5a1T23gOMUJrI+uSuH0VRDStOiUVSjBTRDVBVag=
+github.com/shurcooL/home v0.0.0-20181020052607-80b7ffcb30f9/go.mod h1:+rgNQw2P9ARFAs37qieuu7ohDNQ3gds9msbT2yn85sg=
+github.com/shurcooL/htmlg v0.0.0-20170918183704-d01228ac9e50/go.mod h1:zPn1wHpTIePGnXSHpsVPWEktKXHr6+SS6x/IKRb7cpw=
+github.com/shurcooL/httperror v0.0.0-20170206035902-86b7830d14cc/go.mod h1:aYMfkZ6DWSJPJ6c4Wwz3QtW22G7mf/PEgaB9k/ik5+Y=
+github.com/shurcooL/httpfs v0.0.0-20171119174359-809beceb2371/go.mod h1:ZY1cvUeJuFPAdZ/B6v7RHavJWZn2YPVFQ1OSXhCGOkg=
+github.com/shurcooL/httpgzip v0.0.0-20180522190206-b1c53ac65af9/go.mod h1:919LwcH0M7/W4fcZ0/jy0qGght1GIhqyS/EgWGH2j5Q=
+github.com/shurcooL/issues v0.0.0-20181008053335-6292fdc1e191/go.mod h1:e2qWDig5bLteJ4fwvDAc2NHzqFEthkqn7aOZAOpj+PQ=
+github.com/shurcooL/issuesapp v0.0.0-20180602232740-048589ce2241/go.mod h1:NPpHK2TI7iSaM0buivtFUc9offApnI0Alt/K8hcHy0I=
+github.com/shurcooL/notifications v0.0.0-20181007000457-627ab5aea122/go.mod h1:b5uSkrEVM1jQUspwbixRBhaIjIzL2xazXp6kntxYle0=
+github.com/shurcooL/octicon v0.0.0-20181028054416-fa4f57f9efb2/go.mod h1:eWdoE5JD4R5UVWDucdOPg1g2fqQRq78IQa9zlOV1vpQ=
+github.com/shurcooL/reactions v0.0.0-20181006231557-f2e0b4ca5b82/go.mod h1:TCR1lToEk4d2s07G3XGfz2QrgHXg4RJBvjrOozvoWfk=
+github.com/shurcooL/sanitized_anchor_name v0.0.0-20170918181015-86672fcb3f95/go.mod h1:1NzhyTcUVG4SuEtjjoZeVRXNmyL/1OwPU0+IJeTBvfc=
+github.com/shurcooL/users v0.0.0-20180125191416-49c67e49c537/go.mod h1:QJTqeLYEDaXHZDBsXlPCDqdhQuJkuw4NOtaxYe3xii4=
+github.com/shurcooL/webdavfs v0.0.0-20170829043945-18c3829fa133/go.mod h1:hKmq5kWdCj2z2KEozexVbfEZIWiTjhE0+UjmZgPqehw=
+github.com/sirupsen/logrus v1.0.6 h1:hcP1GmhGigz/O7h1WVUM5KklBp1JoNS9FggWKdj/j3s=
+github.com/sirupsen/logrus v1.0.6/go.mod h1:pMByvHTf9Beacp5x1UXfOR9xyW/9antXMhjMPG0dEzc=
+github.com/sourcegraph/annotate v0.0.0-20160123013949-f4cad6c6324d/go.mod h1:UdhH50NIW0fCiwBSr0co2m7BnFLdv4fQTgdqdJTHFeE=
+github.com/sourcegraph/syntaxhighlight v0.0.0-20170531221838-bd320f5d308e/go.mod h1:HuIsMU8RRBOtsCgI77wP899iHVBQpCmg4ErYMZB+2IA=
+github.com/spf13/afero v1.1.2 h1:m8/z1t7/fwjysjQRYbP0RD+bUIF/8tJwPdEZsI83ACI=
+github.com/spf13/afero v1.1.2/go.mod h1:j4pytiNVoe2o6bmDsKpLACNPDBIoEAkihy7loJ1B0CQ=
+github.com/spf13/cast v1.3.0 h1:oget//CVOEoFewqQxwr0Ej5yjygnqGkvggSE/gB35Q8=
+github.com/spf13/cast v1.3.0/go.mod h1:Qx5cxh0v+4UWYiBimWS+eyWzqEqokIECu5etghLkUJE=
+github.com/spf13/cobra v0.0.3 h1:ZlrZ4XsMRm04Fr5pSFxBgfND2EBVa1nLpiy1stUsX/8=
+github.com/spf13/cobra v0.0.3/go.mod h1:1l0Ry5zgKvJasoi3XT1TypsSe7PqH0Sj9dhYf7v3XqQ=
+github.com/spf13/jwalterweatherman v1.0.0 h1:XHEdyB+EcvlqZamSM4ZOMGlc93t6AcsBEu9Gc1vn7yk=
+github.com/spf13/jwalterweatherman v1.0.0/go.mod h1:cQK4TGJAtQXfYWX+Ddv3mKDzgVb68N+wFjFa4jdeBTo=
+github.com/spf13/viper v1.3.2 h1:VUFqw5KcqRf7i70GOzW7N+Q7+gxVBkSSqiXB12+JQ4M=
+github.com/spf13/viper v1.3.2/go.mod h1:ZiWeW+zYFKm7srdB9IoDzzZXaJaI5eL9QjNiN/DMA2s=
+github.com/stretchr/objx v0.1.0/go.mod h1:HFkY916IF+rwdDfMAkV7OtwuqBVzrE8GR6GFx+wExME=
+github.com/stretchr/testify v1.2.2/go.mod h1:a8OnRcib4nhh0OaRAV+Yts87kKdq0PP7pXfy6kDkUVs=
+github.com/stretchr/testify v1.3.0 h1:TivCn/peBQ7UY8ooIcPgZFpTNSz0Q2U6UrFlUfqbe0Q=
+github.com/stretchr/testify v1.3.0/go.mod h1:M5WIy9Dh21IEIfnGCwXGc5bZfKNJtfHm1UVUgZn+9EI=
+github.com/syndtr/gocapability v0.0.0-20150716010906-2c00daeb6c3b h1:UzwAjzrPQVJoxLfb26YI2WRrhD3g09ZHt9vAQckWiPY=
+github.com/syndtr/gocapability v0.0.0-20150716010906-2c00daeb6c3b/go.mod h1:hkRG7XYTFWNJGYcbNJQlaLq0fg1yr4J4t/NcTQtrfww=
+github.com/tarm/serial v0.0.0-20180830185346-98f6abe2eb07/go.mod h1:kDXzergiv9cbyO7IOYJZWg1U88JhDg3PB6klq9Hg2pA=
+github.com/theupdateframework/notary v0.6.1 h1:7wshjstgS9x9F5LuB1L5mBI2xNMObWqjz+cjWoom6l0=
+github.com/theupdateframework/notary v0.6.1/go.mod h1:MOfgIfmox8s7/7fduvB2xyPPMJCrjRLRizA8OFwpnKY=
+github.com/tonistiigi/fsutil v0.0.0-20181002165410-f567071bed24 h1:W6Trnpx9I6lPEHVFiLq3l1CvzGFxL6+dknaJ9OU0jh0=
+github.com/tonistiigi/fsutil v0.0.0-20181002165410-f567071bed24/go.mod h1:eden9dLzAAuNQ0L7whFr6/Mzgz6btsvQpUnxOOI+CCE=
+github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea h1:SXhTLE6pb6eld/v/cCndK0AMpt1wiVFb/YYmqB3/QG0=
+github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea/go.mod h1:WPnis/6cRcDZSUvVmezrxJPkiO87ThFYsoUiMwWNDJk=
+github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8/go.mod h1:VFNgLljTbGfSG7qAOspJ7OScBnGdDN/yBr0sguwnwf0=
+github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f h1:J9EGpcZtP0E/raorCMxlFGSTBrsSlaDGf3jU/qvAE2c=
+github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f/go.mod h1:N2zxlSyiKSe5eX1tZViRH5QA0qijqEDrYZiPEAiq3wU=
+github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 h1:EzJWgHovont7NscjpAxXsDA8S8BMYve8Y5+7cuRE7R0=
+github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415/go.mod h1:GwrjFmJcFw6At/Gs6z4yjiIwzuJ1/+UwLxMQDVQXShQ=
+github.com/xeipuuv/gojsonschema v0.0.0-20160323030313-93e72a773fad h1:LIwN+8bLzKvIuCiV5yT1nICcW/8yNfU5jVV1SHhcPco=
+github.com/xeipuuv/gojsonschema v0.0.0-20160323030313-93e72a773fad/go.mod h1:5yf86TLmAcydyeJq5YvxkGPE2fm/u4myDekKRoLuqhs=
+github.com/xlab/handysort v0.0.0-20150421192137-fb3537ed64a1 h1:j2hhcujLRHAg872RWAV5yaUrEjHEObwDv3aImCaNLek=
+github.com/xlab/handysort v0.0.0-20150421192137-fb3537ed64a1/go.mod h1:QcJo0QPSfTONNIgpN5RA8prR7fF8nkF6cTWTcNerRO8=
+github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod h1:aYKd//L2LvnjZzWKhF00oedf4jCCReLcmhLdhm1A27Q=
+go.opencensus.io v0.18.0/go.mod h1:vKdFvxhtzZ9onBp9VKHK8z/sRpBMnKAsufL7wlDrCOA=
+go4.org v0.0.0-20180809161055-417644f6feb5/go.mod h1:MkTOUMDaeVYJUOUsaDXIhWPZYa1yOyC1qaOBpL57BhE=
+golang.org/x/build v0.0.0-20190111050920-041ab4dc3f9d/go.mod h1:OWs+y06UdEOHN4y+MfF/py+xQ/tYqIWW03b70/CG9Rw=
+golang.org/x/crypto v0.0.0-20181030102418-4d3f4d9ffa16/go.mod h1:6SG95UA2DQfeDnfUPMdvaQW0Q7yPrPDi9nlGo2tz2b4=
+golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9 h1:mKdxBk7AujPs8kU4m80U72y/zjbZ3UcXC7dClwKbUI0=
+golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9/go.mod h1:6SG95UA2DQfeDnfUPMdvaQW0Q7yPrPDi9nlGo2tz2b4=
+golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod h1:CJ0aWSM057203Lf6IL+f9T1iT9GByDxfZKAQTCR3kQA=
+golang.org/x/lint v0.0.0-20180702182130-06c8688daad7/go.mod h1:UVdnD1Gm6xHRNCYTkRU2/jEulfH38KcIWyp/GAMgvoE=
+golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod h1:UVdnD1Gm6xHRNCYTkRU2/jEulfH38KcIWyp/GAMgvoE=
+golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod h1:wehouNa3lNwaWXcvxsM5YxQ5yQlVC4a0KAMCusXpPoU=
+golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4=
+golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4=
+golang.org/x/net v0.0.0-20180906233101-161cd47e91fd h1:nTDtHvHSdCn1m6ITfMRqtOd/9+7a3s8RBNOZ3eYZzJA=
+golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4=
+golang.org/x/net v0.0.0-20181029044818-c44066c5c816/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4=
+golang.org/x/net v0.0.0-20181106065722-10aee1819953/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4=
+golang.org/x/net v0.0.0-20190213061140-3a22650c66bd h1:HuTn7WObtcDo9uEEU7rEqL0jYthdXAmZ6PP+meazmaU=
+golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4=
+golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod h1:N/0e6XlmueqKjAGxoOufVs8QHGRruUQn6yWY3a++T0U=
+golang.org/x/oauth2 v0.0.0-20181017192945-9dcd33a902f4/go.mod h1:N/0e6XlmueqKjAGxoOufVs8QHGRruUQn6yWY3a++T0U=
+golang.org/x/oauth2 v0.0.0-20181203162652-d668ce993890/go.mod h1:N/0e6XlmueqKjAGxoOufVs8QHGRruUQn6yWY3a++T0U=
+golang.org/x/perf v0.0.0-20180704124530-6e6d33e29852/go.mod h1:JLpeXjPJfIyPr5TlbXLkXWLhP8nz10XfvxElABhCtcw=
+golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f h1:wMNYb4v58l5UBM7MYRLPG6ZhfOqbKu7X5eyFl8ZhKvA=
+golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM=
+golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM=
+golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6 h1:bjcUS9ztw9kFmmIxJInhon/0Is3p+EHBKNgquIzo1OI=
+golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM=
+golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
+golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
+golang.org/x/sys v0.0.0-20181029174526-d69651ed3497/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
+golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a h1:1n5lsVfiQW3yfsRGu98756EH1YthsFqr/5mxHduZW2A=
+golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
+golang.org/x/text v0.3.0 h1:g61tztE5qeGQ89tm6NTjjM9VPIm088od1l6aSorWRWg=
+golang.org/x/text v0.3.0/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
+golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2 h1:z99zHgr7hKfrUcX/KsoJk5FJfjTceCKIp96+biqP4To=
+golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
+golang.org/x/time v0.0.0-20180412165947-fbb02b2291d2 h1:+DCIGbF/swA92ohVg0//6X2IVY3KZs6p9mix0ziNYJM=
+golang.org/x/time v0.0.0-20180412165947-fbb02b2291d2/go.mod h1:tRJNPiyCQ0inRvYxbN9jk5I+vvW/OXSQhTDSoE431IQ=
+golang.org/x/time v0.0.0-20181108054448-85acf8d2951c h1:fqgJT0MGcGpPgpWU7VRdRjuArfcOvC4AoJmILihzhDg=
+golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod h1:tRJNPiyCQ0inRvYxbN9jk5I+vvW/OXSQhTDSoE431IQ=
+golang.org/x/tools v0.0.0-20180828015842-6cd1fcedba52/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ=
+golang.org/x/tools v0.0.0-20181030000716-a0a13e073c7b/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ=
+golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ=
+golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod h1:9Yl7xja0Znq3iFh3HoIrodX9oNMXvdceNzlUR8zjMvY=
+google.golang.org/api v0.0.0-20180910000450-7ca32eb868bf/go.mod h1:4mhQ8q/RsB7i+udVvVy5NUi08OU8ZlA0gRVgrF7VFY0=
+google.golang.org/api v0.0.0-20181030000543-1d582fd0359e/go.mod h1:4mhQ8q/RsB7i+udVvVy5NUi08OU8ZlA0gRVgrF7VFY0=
+google.golang.org/api v0.1.0/go.mod h1:UGEZY7KEX120AnNLIHFMKIo4obdJhkp2tPbaPlQx13Y=
+google.golang.org/appengine v1.1.0/go.mod h1:EbEs0AVv82hx2wNQdGPgUI5lhzA/G0D9YwlJXL52JkM=
+google.golang.org/appengine v1.2.0/go.mod h1:xpcJRLb0r/rnEns0DIKYYv+WjYCduHsrkT7/EB5XEv4=
+google.golang.org/appengine v1.3.0/go.mod h1:xpcJRLb0r/rnEns0DIKYYv+WjYCduHsrkT7/EB5XEv4=
+google.golang.org/appengine v1.4.0 h1:/wp5JvzpHIxhs/dumFmF7BXTf3Z+dd4uXta4kVyO508=
+google.golang.org/appengine v1.4.0/go.mod h1:xpcJRLb0r/rnEns0DIKYYv+WjYCduHsrkT7/EB5XEv4=
+google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod h1:JiN7NxoALGmiZfu7CAH4rXhgtRTLTxftemlI0sWmxmc=
+google.golang.org/genproto v0.0.0-20180831171423-11092d34479b/go.mod h1:JiN7NxoALGmiZfu7CAH4rXhgtRTLTxftemlI0sWmxmc=
+google.golang.org/genproto v0.0.0-20181029155118-b69ba1387ce2/go.mod h1:JiN7NxoALGmiZfu7CAH4rXhgtRTLTxftemlI0sWmxmc=
+google.golang.org/genproto v0.0.0-20181202183823-bd91e49a0898/go.mod h1:7Ep/1NZk928CDR8SjdVbjWNpdIf6nzjE3BTgJDr2Atg=
+google.golang.org/genproto v0.0.0-20190306203927-b5d61aea6440 h1:VOR2wHHZJgoALLvnlCN4JUaWACO1lOLXiSN2F3g/GXU=
+google.golang.org/genproto v0.0.0-20190306203927-b5d61aea6440/go.mod h1:VzzqZJRnGkLBvHegQrXjBqPurQTc5/KpmUdxsrq26oE=
+google.golang.org/grpc v1.14.0/go.mod h1:yo6s7OP7yaDglbqo1J04qKzAhqBH6lvTonzMVmEdcZw=
+google.golang.org/grpc v1.16.0/go.mod h1:0JHn/cJsOMiMfNA9+DeHDlAU7KAAB5GDlYFpa9MZMio=
+google.golang.org/grpc v1.17.0/go.mod h1:6QZJwpn2B+Zp71q/5VxRsJ6NXXVCE5NRUHRo+f3cWCs=
+google.golang.org/grpc v1.19.0 h1:cfg4PD8YEdSFnm7qLV4++93WcmhH2nIUhMjhdCvl3j8=
+google.golang.org/grpc v1.19.0/go.mod h1:mqu4LbDTu4XGKhr4mRzUsmM4RtVoemTSY81AxZiDr8c=
+gopkg.in/airbrake/gobrake.v2 v2.0.9 h1:7z2uVWwn7oVeeugY1DtlPAy5H+KYgB1KeKTnqjNatLo=
+gopkg.in/airbrake/gobrake.v2 v2.0.9/go.mod h1:/h5ZAUhDkGaJfjzjKLSjv6zCL6O0LLBxU4K+aSYdM/U=
+gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405 h1:yhCVgyC4o1eVCa2tZl7eS0r+SDo693bJlVdllGtEeKM=
+gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=
+gopkg.in/dancannon/gorethink.v3 v3.0.5 h1:/g7PWP7zUS6vSNmHSDbjCHQh1Rqn8Jy6zSMQxAsBSMQ=
+gopkg.in/dancannon/gorethink.v3 v3.0.5/go.mod h1:GXsi1e3N2OcKhcP6nsYABTiUejbWMFO4GY5a4pEaeEc=
+gopkg.in/fatih/pool.v2 v2.0.0 h1:xIFeWtxifuQJGk/IEPKsTduEKcKvPmhoiVDGpC40nKg=
+gopkg.in/fatih/pool.v2 v2.0.0/go.mod h1:8xVGeu1/2jr2wm5V9SPuMht2H5AEmf5aFMGSQixtjTY=
+gopkg.in/fsnotify.v1 v1.4.7 h1:xOHLXZwVvI9hhs+cLKq5+I5onOuwQLhQwiu63xxlHs4=
+gopkg.in/fsnotify.v1 v1.4.7/go.mod h1:Tz8NjZHkW78fSQdbUxIjBTcgA1z1m8ZHf0WmKUhAMys=
+gopkg.in/gemnasium/logrus-airbrake-hook.v2 v2.1.2 h1:OAj3g0cR6Dx/R07QgQe8wkA9RNjB2u4i700xBkIT4e0=
+gopkg.in/gemnasium/logrus-airbrake-hook.v2 v2.1.2/go.mod h1:Xk6kEKp8OKb+X14hQBKWaSkCsqBpgog8nAV2xsGOxlo=
+gopkg.in/gorethink/gorethink.v3 v3.0.5 h1:e2Uc/Xe+hpcVQFsj6MuHlYog3r0JYpnTzwDj/y2O4MU=
+gopkg.in/gorethink/gorethink.v3 v3.0.5/go.mod h1:+3yIIHJUGMBK+wyPH+iN5TP+88ikFDfZdqTlK3Y9q8I=
+gopkg.in/inf.v0 v0.9.1 h1:73M5CoZyi3ZLMOyDlQh031Cx6N9NDJ2Vvfl76EDAgDc=
+gopkg.in/inf.v0 v0.9.1/go.mod h1:cWUDdTG/fYaXco+Dcufb5Vnc6Gp2YChqWtbxRZE0mXw=
+gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 h1:uRGJdciOHaEIrze2W8Q3AKkepLTh2hOroT7a+7czfdQ=
+gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=
+gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
+gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
+gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
+gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
+gotest.tools v2.1.0+incompatible h1:5USw7CrJBYKqjg9R7QlA6jzqZKEAtvW82aNmsxxGPxw=
+gotest.tools v2.1.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
+grpc.go4.org v0.0.0-20170609214715-11d0a25b4919/go.mod h1:77eQGdRu53HpSqPFJFmuJdjuHRquDANNeA4x7B8WQ9o=
+honnef.co/go/tools v0.0.0-20180728063816-88497007e858/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
+honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
+honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
+k8s.io/api v0.0.0-20180712090710-2d6f90ab1293 h1:hROmpFC7JMobXFXMmD7ZKZLhDKvr1IKfFJoYS/45G/8=
+k8s.io/api v0.0.0-20180712090710-2d6f90ab1293/go.mod h1:iuAfoD4hCxJ8Onx9kaTIt30j7jUFS00AXQi6QMi99vA=
+k8s.io/apimachinery v0.0.0-20180621070125-103fd098999d h1:MZjlsu9igBoVPZkXpIGoxI6EonqNsXXZU7hhvfQLkd4=
+k8s.io/apimachinery v0.0.0-20180621070125-103fd098999d/go.mod h1:ccL7Eh7zubPUSh9A3USN90/OzHNSVN6zxzde07TDCL0=
+k8s.io/client-go v0.0.0-20180806134042-1f13a808da65 h1:kQX7jEIMYrWV9XqFN4usRaBLzCu7fd/qsCXxbgf3+9g=
+k8s.io/client-go v0.0.0-20180806134042-1f13a808da65/go.mod h1:7vJpHMYJwNQCWgzmNV+VYUl1zCObLyodBc8nIyt8L5s=
+k8s.io/kube-openapi v0.0.0-20180719232738-d8ea2fe547a4 h1:C8xi0mJeE8wOFsLofmG7JVxRV2ZAgjYftRc9m2ypdmo=
+k8s.io/kube-openapi v0.0.0-20180719232738-d8ea2fe547a4/go.mod h1:BXM9ceUBTj2QnfH2MK1odQs778ajze1RxcmP6S8RVVc=
+k8s.io/kubernetes v1.11.2 h1:0XeIy/mHhEFiXkcCNn25muHIMJ/aYT2E9Uea40aD9Ck=
+k8s.io/kubernetes v1.11.2/go.mod h1:ocZa8+6APFNC2tX1DZASIbocyYT5jHzqFVsY5aoB7Jk=
+sourcegraph.com/sourcegraph/go-diff v0.5.0/go.mod h1:kuch7UrkMzY0X+p9CRK03kfuPQ2zzQcaEFbx8wA8rck=
+sourcegraph.com/sqs/pbtypes v0.0.0-20180604144634-d3ebe8f20ae4/go.mod h1:ketZ/q3QxT9HOBeFhu6RdvsftgpsbFHBF5Cas6cDKZ0=
+vbom.ml/util v0.0.0-20170409195630-256737ac55c4 h1:VRvrHgbw/Yg8mlNgD20TTQsTXTNJenU4jFUEqVxDRCU=
+vbom.ml/util v0.0.0-20170409195630-256737ac55c4/go.mod h1:so/NYdZXCz+E3ZpW0uAoCj6uzU2+8OWDFv/HxUSs7kI=
-- 
2.19.2
